#!/bin/bash

# Manage 1Password sync automation (simplified)

set -euo pipefail

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

usage() {
    echo "🤖 1Password Sync Automation Manager"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  status      Show automation status"
    echo "  logs        Show sync logs"
    echo "  test        Test sync manually"
    echo "  schedule    Show next scheduled sync times"
    echo ""
}

show_status() {
    info "🤖 Automation Status"
    echo ""
    
    # Check cron job
    if crontab -l 2>/dev/null | grep -q "docker-stack/scripts/sync-cron.sh"; then
        echo -e "Cron Job: ${GREEN}✅ Enabled${NC} (every 30 minutes)"
    else
        echo -e "Cron Job: ${RED}❌ Disabled${NC}"
    fi
    
    # Systemd removed - using cron only
    echo -e "Systemd Timer: ${BLUE}ℹ️  Removed (using cron only)${NC}"
    
    # Check 1Password auth
    if op account list >/dev/null 2>&1; then
        echo -e "1Password Auth: ${GREEN}✅ Authenticated${NC}"
    else
        echo -e "1Password Auth: ${RED}❌ Not authenticated${NC}"
        warn "Run 'op signin' to enable automatic sync"
    fi
    
    # Show log file location
    local log_file="/var/log/docker-secrets-sync.log"
    if [[ ! -f "$log_file" ]]; then
        log_file="$HOME/docker-secrets-sync.log"
    fi
    
    if [[ -f "$log_file" ]]; then
        local last_sync=$(tail -n 1 "$log_file" 2>/dev/null | grep -oE '\[[^]]+\]' | tr -d '[]' || echo "Never")
        echo -e "Last Sync: ${BLUE}$last_sync${NC}"
        echo -e "Log File: ${BLUE}$log_file${NC}"
    else
        echo -e "Last Sync: ${YELLOW}No logs found${NC}"
    fi
}

show_logs() {
    local log_file="/var/log/docker-secrets-sync.log"
    if [[ ! -f "$log_file" ]]; then
        log_file="$HOME/docker-secrets-sync.log"
    fi
    
    if [[ -f "$log_file" ]]; then
        info "📋 Recent sync logs:"
        echo ""
        tail -n 20 "$log_file"
    else
        warn "No log file found"
    fi
}

show_schedule() {
    info "📅 Sync Schedule"
    echo ""
    
    # Show cron schedule
    if crontab -l 2>/dev/null | grep -q "sync-cron.sh"; then
        echo "Cron Schedule: Every 30 minutes"
        echo "Next cron runs: $(date -d 'now + 30 minutes' '+%H:%M'), $(date -d 'now + 60 minutes' '+%H:%M'), $(date -d 'now + 90 minutes' '+%H:%M')"
    fi
}

test_sync() {
    info "🧪 Testing sync manually..."
    echo ""
    
    if /home/mumbles/docker-stack/scripts/sync-cron.sh; then
        log "✅ Manual sync completed successfully"
    else
        error "❌ Manual sync failed"
        return 1
    fi
}

# Main command handling
case "${1:-status}" in
    status)
        show_status
        ;;
    logs)
        show_logs
        ;;
    test)
        test_sync
        ;;
    schedule)
        show_schedule
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        error "Unknown command: $1"
        usage
        exit 1
        ;;
esac
