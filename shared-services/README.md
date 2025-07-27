# Shared Services Stack

This directory contains shared database services (PostgreSQL and Redis) that are used by multiple applications in your docker stack.

## Architecture

### Services Provided
- **PostgreSQL 16** (`shared_postgres`): Shared relational database
- **Redis 7** (`shared_redis`): Shared caching and session storage

### Current Databases
- `authentik` - Authentik authentication service
- `nextcloud` - Nextcloud file storage
- `immich` - Immich photo management

## Usage

### Management Script
Use the `manage.sh` script for common operations:

```bash
# Start shared services
./manage.sh start

# Stop shared services  
./manage.sh stop

# Check status
./manage.sh status

# View passwords
./manage.sh passwords

# Connect to PostgreSQL
./manage.sh psql

# Connect to Redis
./manage.sh redis-cli

# Backup databases
./manage.sh backup
```

### Configuration

**PostgreSQL Connection:**
- Host: `shared_postgres`
- Port: `5432`
- User: `postgres`
- Password: (see `.env` file)

**Redis Connection:**
- Host: `shared_redis`
- Port: `6379`
- Password: (see `.env` file)

## Network Configuration

The shared services run on the `shared-services` network. Applications that need to access these services must:

1. Add `shared-services` to their networks configuration
2. Use the service names (`shared_postgres`, `shared_redis`) as hostnames

Example in docker-compose.yml:
```yaml
services:
  your-app:
    networks:
      - your-app-network
      - shared-services

networks:
  your-app-network:
    driver: bridge
  shared-services:
    external: true
```

## Resource Benefits

By using shared services instead of individual database containers per application:

**Before:**
- 2 Redis instances (nextcloud-redis, authentik-redis)
- 1 PostgreSQL instance (authentik-postgresql)
- Would have been 3 Redis + 2 PostgreSQL with individual Immich services

**After:**
- 1 Redis instance (shared_redis)
- 1 PostgreSQL instance (shared_postgres)
- All applications share these resources

**Resource Savings:**
- ~400-600MB RAM savings
- Reduced CPU overhead
- Simplified backup and maintenance
- Better resource utilization

## Migration Notes

When migrating existing services to use shared databases:

1. Backup existing data first
2. Update application configuration to point to shared services
3. Remove old database services from docker-compose files
4. Add `shared-services` network to application networks
5. Test connectivity before removing old containers

## Security

- Database passwords are randomly generated and stored in `.env`
- Services are isolated on dedicated Docker networks
- Only applications that explicitly join the `shared-services` network can access the databases
