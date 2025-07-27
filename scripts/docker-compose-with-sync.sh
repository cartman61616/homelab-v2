#!/bin/bash

# Docker Compose wrapper with automatic 1Password sync
# This script syncs secrets before running docker compose commands

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STACK_DIR="$(dirname "$SCRIPT_DIR")"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[SYNC]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

# Function to sync secrets
sync_secrets() {
    log "🔄 Auto-syncing secrets from 1Password..."
    
    if "$SCRIPT_DIR/secrets" sync --force >/dev/null 2>&1; then
        log "✅ Secrets synced successfully"
        return 0
    else
        warn "⚠️  Failed to sync secrets, using existing .env files"
        return 1
    fi
}

# Function to check if sync is needed
should_sync() {
    # Check if any template is newer than corresponding .env file
    local needs_sync=false
    
    for service in authentik immich monitoring nextcloud traefik; do
        local template="/home/mumbles/dotfiles/docker/$service/.env.template"
        local env_file="/home/mumbles/dotfiles/docker/$service/.env.local"
        
        if [[ -f "$template" && -f "$env_file" ]]; then
            if [[ "$template" -nt "$env_file" ]]; then
                needs_sync=true
                break
            fi
        elif [[ -f "$template" && ! -f "$env_file" ]]; then
            needs_sync=true
            break
        fi
    done
    
    echo $needs_sync
}

# Main execution
main() {
    cd "$STACK_DIR"
    
    # Check if we should sync
    if [[ "$(should_sync)" == "true" ]]; then
        info "🔍 Templates newer than env files, syncing..."
        sync_secrets
    else
        # Always sync for up/start commands to ensure latest secrets
        if [[ "${1:-}" =~ ^(up|start)$ ]]; then
            log "🚀 Starting services, ensuring latest secrets..."
            sync_secrets
        fi
    fi
    
    # Run the actual docker compose command
    info "🐳 Running: docker compose $*"
    exec docker compose "$@"
}

# Show help if no arguments
if [[ $# -eq 0 ]]; then
    echo "🔐 Docker Compose with Auto-Sync"
    echo ""
    echo "This wrapper automatically syncs 1Password secrets before running docker compose commands."
    echo ""
    echo "Usage: $0 [docker-compose-args...]"
    echo ""
    echo "Examples:"
    echo "  $0 up -d              # Sync secrets, then start all services"
    echo "  $0 restart traefik    # Sync if needed, then restart traefik"
    echo "  $0 logs -f immich     # Check sync, then show logs"
    echo "  $0 ps                 # Check sync, then show status"
    echo ""
    echo "The sync occurs:"
    echo "  - Always before 'up' or 'start' commands"
    echo "  - When templates are newer than .env files"
    echo "  - Can be disabled with SKIP_SYNC=1 environment variable"
    echo ""
    exit 0
fi

# Allow skipping sync with environment variable
if [[ "${SKIP_SYNC:-}" == "1" ]]; then
    info "⏭️  Skipping sync (SKIP_SYNC=1)"
    cd "$STACK_DIR"
    exec docker compose "$@"
else
    main "$@"
fi
