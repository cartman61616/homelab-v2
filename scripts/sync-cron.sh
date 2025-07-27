#!/bin/bash

# Cron-friendly 1Password sync script
# This script safely syncs secrets and logs results

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="/var/log/docker-secrets-sync.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Ensure log file exists and is writable
sudo touch "$LOG_FILE" 2>/dev/null || LOG_FILE="$HOME/docker-secrets-sync.log"
sudo chown mumbles:mumbles "$LOG_FILE" 2>/dev/null || true

log_message() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOG_FILE"
}

# Check if 1Password is authenticated
if ! op account list >/dev/null 2>&1; then
    log_message "⚠️  1Password not authenticated, skipping sync"
    exit 0
fi

# Run the sync
if "$SCRIPT_DIR/secrets" sync --force >/dev/null 2>&1; then
    log_message "✅ Secrets synced successfully"
    
    # Optional: restart services if needed
    # Uncomment the next lines if you want to restart Docker services after sync
    # cd "$(dirname "$SCRIPT_DIR")"
    # docker compose restart >/dev/null 2>&1 && log_message "🔄 Services restarted"
    
    exit 0
else
    log_message "❌ Failed to sync secrets"
    exit 1
fi
