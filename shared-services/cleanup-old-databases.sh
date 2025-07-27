#!/bin/bash

echo "🧹 Cleaning up old database containers..."
echo ""

# List what will be removed
echo "The following containers will be stopped and removed:"
echo "- authentik-postgresql-1"
echo "- authentik-redis-1"
echo "- nextcloud-redis"
echo ""

read -p "Are you sure you want to proceed? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Stopping and removing old database containers..."
    
    # Stop and remove Authentik old databases
    docker stop authentik-postgresql-1 authentik-redis-1 2>/dev/null || true
    docker rm authentik-postgresql-1 authentik-redis-1 2>/dev/null || true
    
    # Stop and remove Nextcloud old Redis
    docker stop nextcloud-redis 2>/dev/null || true
    docker rm nextcloud-redis 2>/dev/null || true
    
    # Clean up orphaned volumes (be careful!)
    echo ""
    echo "Cleaning up orphaned volumes..."
    docker volume ls -q | grep -E "(authentik.*redis|authentik.*database|nextcloud.*redis)" | xargs -r docker volume rm 2>/dev/null || true
    
    echo ""
    echo "✅ Cleanup completed!"
    echo ""
    echo "Current database services:"
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | head -1
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | grep -E "(shared|postgres|redis)"
    
else
    echo "Cleanup cancelled."
fi
