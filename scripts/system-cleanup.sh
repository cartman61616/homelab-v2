#!/bin/bash

# System Cleanup Script for Docker Stack Server
# Run this periodically to keep the server clean

set -euo pipefail

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[CLEANUP]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

usage() {
    echo "🧹 System Cleanup Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --docker     Clean Docker images, containers, volumes"
    echo "  --logs       Clean system logs older than 7 days"
    echo "  --apt        Clean APT cache and autoremove packages"
    echo "  --temp       Clean temporary files"
    echo "  --all        Run all cleanup operations"
    echo "  --dry-run    Show what would be cleaned without doing it"
    echo ""
}

show_disk_usage() {
    info "📊 Current Disk Usage:"
    df -h / | tail -n 1 | awk '{print "  Root: " $3 " used of " $2 " (" $5 " full)"}'
    
    echo ""
    info "🐳 Docker Usage:"
    docker system df | tail -n +2 | while read line; do
        echo "  $line"
    done
}

cleanup_docker() {
    log "🐳 Cleaning Docker system..."
    
    # Show current usage
    local before=$(docker system df --format "table {{.Type}}\t{{.Size}}" | grep "Images" | awk '{print $2}' | sed 's/GB//' | sed 's/MB//')
    
    # Clean unused images
    log "  Removing unused images..."
    docker image prune -f >/dev/null
    
    # Clean unused containers
    log "  Removing stopped containers..."
    docker container prune -f >/dev/null
    
    # Clean unused volumes
    log "  Removing unused volumes..."
    docker volume prune -f >/dev/null
    
    # Clean build cache
    log "  Cleaning build cache..."
    docker builder prune -f >/dev/null 2>&1 || true
    
    log "✅ Docker cleanup complete"
}

cleanup_logs() {
    log "📋 Cleaning system logs..."
    
    # Clean journal logs older than 7 days
    local before=$(sudo journalctl --disk-usage | grep -oE '[0-9.]+[GM]')
    sudo journalctl --vacuum-time=7d >/dev/null 2>&1
    local after=$(sudo journalctl --disk-usage | grep -oE '[0-9.]+[GM]')
    
    log "  Journal logs: $before → $after"
    log "✅ Log cleanup complete"
}

cleanup_apt() {
    log "📦 Cleaning APT cache..."
    
    # Remove unnecessary packages
    sudo apt autoremove -y >/dev/null 2>&1
    
    # Clean package cache
    sudo apt autoclean >/dev/null 2>&1
    
    log "✅ APT cleanup complete"
}

cleanup_temp() {
    log "🗑️  Cleaning temporary files..."
    
    # Clean /tmp files older than 7 days
    find /tmp -type f -mtime +7 -delete 2>/dev/null || true
    
    # Clean old backup files in home directory
    find /home/mumbles -name "*.backup*" -mtime +7 -delete 2>/dev/null || true
    find /home/mumbles -name "*.bak" -mtime +7 -delete 2>/dev/null || true
    find /home/mumbles -name "*.tmp" -mtime +7 -delete 2>/dev/null || true
    
    # Clean VSCode cache if it gets too large
    if [[ -d "/home/mumbles/.cache/code-server" ]]; then
        find /home/mumbles/.cache/code-server -name "*.deb" -delete 2>/dev/null || true
    fi
    
    log "✅ Temporary file cleanup complete"
}

# Parse arguments
DRY_RUN=false
CLEAN_DOCKER=false
CLEAN_LOGS=false
CLEAN_APT=false
CLEAN_TEMP=false
CLEAN_ALL=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --docker)
            CLEAN_DOCKER=true
            shift
            ;;
        --logs)
            CLEAN_LOGS=true
            shift
            ;;
        --apt)
            CLEAN_APT=true
            shift
            ;;
        --temp)
            CLEAN_TEMP=true
            shift
            ;;
        --all)
            CLEAN_ALL=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            warn "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Default to showing usage if no options
if [[ "$CLEAN_ALL" == "false" && "$CLEAN_DOCKER" == "false" && "$CLEAN_LOGS" == "false" && "$CLEAN_APT" == "false" && "$CLEAN_TEMP" == "false" ]]; then
    show_disk_usage
    echo ""
    usage
    exit 0
fi

# Set all cleanup flags if --all is specified
if [[ "$CLEAN_ALL" == "true" ]]; then
    CLEAN_DOCKER=true
    CLEAN_LOGS=true
    CLEAN_APT=true
    CLEAN_TEMP=true
fi

info "🧹 Starting system cleanup..."
echo ""

show_disk_usage
echo ""

# Dry run mode
if [[ "$DRY_RUN" == "true" ]]; then
    warn "🔍 DRY RUN MODE - No changes will be made"
    echo ""
    
    [[ "$CLEAN_DOCKER" == "true" ]] && echo "Would clean: Docker images, containers, volumes"
    [[ "$CLEAN_LOGS" == "true" ]] && echo "Would clean: System logs older than 7 days"
    [[ "$CLEAN_APT" == "true" ]] && echo "Would clean: APT cache and unused packages"
    [[ "$CLEAN_TEMP" == "true" ]] && echo "Would clean: Temporary and backup files"
    
    exit 0
fi

# Run selected cleanup operations
[[ "$CLEAN_DOCKER" == "true" ]] && cleanup_docker
[[ "$CLEAN_LOGS" == "true" ]] && cleanup_logs
[[ "$CLEAN_APT" == "true" ]] && cleanup_apt
[[ "$CLEAN_TEMP" == "true" ]] && cleanup_temp

echo ""
info "🎉 Cleanup complete!"
echo ""
show_disk_usage
