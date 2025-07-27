#!/bin/bash

# Shared Services Management Script

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

# Load environment variables
if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
fi

show_help() {
    echo "Shared Services Management Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  start         Start shared services"
    echo "  stop          Stop shared services"
    echo "  restart       Restart shared services"
    echo "  status        Show status of shared services"
    echo "  logs          Show logs from shared services"
    echo "  psql          Connect to PostgreSQL"
    echo "  redis-cli     Connect to Redis"
    echo "  backup        Backup all databases"
    echo "  passwords     Show database passwords"
    echo "  help          Show this help message"
}

case "$1" in
    start)
        echo "Starting shared services..."
        cd "$SCRIPT_DIR" && docker compose up -d
        ;;
    stop)
        echo "Stopping shared services..."
        cd "$SCRIPT_DIR" && docker compose down
        ;;
    restart)
        echo "Restarting shared services..."
        cd "$SCRIPT_DIR" && docker compose restart
        ;;
    status)
        echo "Shared services status:"
        docker ps --filter "name=shared_" --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
        ;;
    logs)
        cd "$SCRIPT_DIR" && docker compose logs -f
        ;;
    psql)
        echo "Connecting to PostgreSQL..."
        docker exec -it shared_postgres psql -U postgres
        ;;
    redis-cli)
        echo "Connecting to Redis..."
        docker exec -it shared_redis redis-cli -a "$REDIS_PASSWORD"
        ;;
    backup)
        echo "Creating database backups..."
        mkdir -p "$SCRIPT_DIR/backups/$(date +%Y%m%d_%H%M%S)"
        BACKUP_DIR="$SCRIPT_DIR/backups/$(date +%Y%m%d_%H%M%S)"
        
        # Backup all databases
        for db in authentik nextcloud immich; do
            echo "Backing up $db database..."
            docker exec shared_postgres pg_dump -U postgres -d "$db" > "$BACKUP_DIR/${db}.sql"
        done
        
        # Backup Redis
        echo "Backing up Redis..."
        docker exec shared_redis redis-cli -a "$REDIS_PASSWORD" --rdb - > "$BACKUP_DIR/redis.rdb"
        
        echo "Backups saved to: $BACKUP_DIR"
        ;;
    passwords)
        echo "Database Passwords:"
        echo "PostgreSQL: $POSTGRES_PASSWORD"
        echo "Redis: $REDIS_PASSWORD"
        ;;
    help|*)
        show_help
        ;;
esac
