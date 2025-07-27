#!/bin/bash

# 1Password Docker Stack Helper
# Comprehensive script to manage secrets with 1Password

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STACK_DIR="$(dirname "$SCRIPT_DIR")"
DOTFILES_DIR="$HOME/dotfiles/docker"
VAULT="Docker-Stack"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Services
SERVICES=("authentik" "immich" "monitoring" "nextcloud" "traefik")

log() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

usage() {
    echo "🔐 1Password Docker Stack Helper"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  status     Show current integration status"
    echo "  sync       Sync all .env files from 1Password (force overwrite)"
    echo "  backup     Backup current secrets to 1Password"
    echo "  list       List all secrets in 1Password vault"
    echo "  rotate     Generate and update a specific secret"
    echo ""
    echo "Options:"
    echo "  --service SERVICE  Target specific service (authentik,immich,monitoring,nextcloud,traefik)"
    echo "  --force           Force overwrite without confirmation"
    echo ""
    echo "Examples:"
    echo "  $0 status                    # Check current status"
    echo "  $0 sync --force             # Sync all services without prompts"
    echo "  $0 sync --service traefik   # Sync only traefik"
    echo "  $0 list                     # List all secrets"
}

check_op_auth() {
    if ! op account list >/dev/null 2>&1; then
        error "Not authenticated with 1Password. Run: op signin"
    fi
}

show_status() {
    log "🔐 1Password Docker Stack Integration Status"
    echo ""
    
    # Check 1Password CLI auth
    if op account list >/dev/null 2>&1; then
        echo -e "1Password CLI: ${GREEN}✅ Authenticated${NC}"
        echo "Account: $(op account list | tail -n1 | awk '{print $3}')"
    else
        echo -e "1Password CLI: ${RED}❌ Not authenticated${NC}"
        return 1
    fi
    
    echo ""
    echo "📊 Service Status:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "%-12s %-12s %-12s %-20s\n" "SERVICE" "TEMPLATE" "ENV FILE" "LAST UPDATED"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    for service in "${SERVICES[@]}"; do
        local template_file="$DOTFILES_DIR/$service/.env.template"
        local env_file="$DOTFILES_DIR/$service/.env.local"
        
        printf "%-12s " "$service"
        
        if [[ -f "$template_file" ]]; then
            printf "${GREEN}%-12s${NC} " "✅ Found"
        else
            printf "${RED}%-12s${NC} " "❌ Missing"
        fi
        
        if [[ -f "$env_file" ]]; then
            printf "${GREEN}%-12s${NC} " "✅ Found"
            printf "%-20s\n" "$(stat -c %y "$env_file" | cut -d. -f1)"
        else
            printf "${RED}%-12s${NC} " "❌ Missing"
            printf "%-20s\n" "N/A"
        fi
    done
    
    echo ""
    echo "📦 1Password Vault: $VAULT"
    local item_count=$(op item list --vault="$VAULT" --format=json | jq length 2>/dev/null || echo "0")
    echo "Total secrets stored: $item_count"
}

sync_secrets() {
    local target_service="$1"
    local force_overwrite="$2"
    
    check_op_auth
    log "🔄 Syncing environment files from 1Password..."
    
    local services_to_sync=("${SERVICES[@]}")
    if [[ "$target_service" != "all" ]]; then
        services_to_sync=("$target_service")
    fi
    
    for service in "${services_to_sync[@]}"; do
        local template_file="$DOTFILES_DIR/$service/.env.template"
        local env_file="$DOTFILES_DIR/$service/.env.local"
        
        if [[ ! -f "$template_file" ]]; then
            warn "No template found for $service, skipping..."
            continue
        fi
        
        log "Syncing $service..."
        
        # Backup existing file
        if [[ -f "$env_file" ]]; then
            cp "$env_file" "$env_file.backup.$(date +%Y%m%d_%H%M%S)"
        fi
        
        # Inject secrets with force flag
        if [[ "$force_overwrite" == "true" ]]; then
            if op inject -i "$template_file" -o "$env_file" --force >/dev/null 2>&1; then
                log "  ✅ $service synced successfully"
            else
                error "  ❌ Failed to sync $service"
            fi
        else
            if op inject -i "$template_file" -o "$env_file" >/dev/null 2>&1; then
                log "  ✅ $service synced successfully"
            else
                error "  ❌ Failed to sync $service"
            fi
        fi
    done
    
    log "✅ Environment sync complete!"
}

list_secrets() {
    check_op_auth
    log "📋 Secrets in vault: $VAULT"
    echo ""
    op item list --vault="$VAULT" --format=table 2>/dev/null || op item list --vault="$VAULT"
}

# Parse command line arguments
COMMAND="${1:-help}"
SERVICE="all"
FORCE="false"

shift || true
while [[ $# -gt 0 ]]; do
    case $1 in
        --service)
            SERVICE="$2"
            shift 2
            ;;
        --force)
            FORCE="true"
            shift
            ;;
        *)
            warn "Unknown option: $1"
            shift
            ;;
    esac
done

# Main command handling
case "$COMMAND" in
    status)
        show_status
        ;;
    sync)
        sync_secrets "$SERVICE" "$FORCE"
        ;;
    list)
        list_secrets
        ;;
    backup)
        log "Running backup script..."
        "$SCRIPT_DIR/backup-secrets.sh"
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        error "Unknown command: $COMMAND\n$(usage)"
        ;;
esac
