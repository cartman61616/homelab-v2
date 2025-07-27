# 🔐 Authentik Identity Provider

Authentik is an open-source identity provider that provides single sign-on (SSO), user management, and authentication services for your entire Docker stack.

## 🏗️ Architecture

Authentik now uses **shared database services** for improved resource efficiency:

```
┌─────────────────┐    ┌─────────────────┐
│   Authentik     │    │ Shared Services │
├─────────────────┤    ├─────────────────┤
│ • Server        │───►│ • PostgreSQL    │
│ • Worker        │───►│ • Redis (DB 1)  │
└─────────────────┘    └─────────────────┘
```

## 📦 Components

- **authentik-server:** Web interface and API server
- **authentik-worker:** Background task processor
- **Database:** Shared PostgreSQL (`shared_postgres`, database: `authentik`)
- **Cache:** Shared Redis (`shared_redis`, database: 1)

## 🚀 Setup Instructions

### Prerequisites
1. **Shared services must be running first:**
   ```bash
   cd ../shared-services
   ./manage.sh start
   ./manage.sh status  # Verify services are healthy
   ```

2. **Domain configuration:**
   - Ensure `auth.snorlax.me` points to your server
   - Traefik handles SSL certificates automatically

### Installation

1. **Start Authentik:**
   ```bash
   docker compose up -d
   ```

2. **Verify startup:**
   ```bash
   docker compose logs -f
   ```

3. **Access the admin interface:**
   - URL: `https://auth.snorlax.me`
   - Default login: Check `.env` file for `AUTHENTIK_BOOTSTRAP_*` credentials

## 🔧 Configuration

### Environment Variables
Key settings in `.env`:
```bash
# Domain
DOMAIN=snorlax.me

# Admin credentials
AUTHENTIK_BOOTSTRAP_PASSWORD=your_admin_password
AUTHENTIK_BOOTSTRAP_EMAIL=admin@snorlax.me

# Shared database configuration (automatically configured)
AUTHENTIK_POSTGRESQL__HOST=shared_postgres
AUTHENTIK_POSTGRESQL__USER=authentik
AUTHENTIK_POSTGRESQL__NAME=authentik
AUTHENTIK_POSTGRESQL__PASSWORD=secure_password

# Shared Redis configuration (automatically configured) 
AUTHENTIK_REDIS__HOST=shared_redis
AUTHENTIK_REDIS__PASSWORD=secure_password
AUTHENTIK_REDIS__DB=1
```

### Database Migration Status
✅ **Migration Complete:**
- **Old:** `authentik-postgresql-1` (dedicated container)
- **New:** `shared_postgres` (shared container, database: `authentik`)
- **Benefits:** ~150MB RAM savings + simplified management

## 🔗 Integration

### Traefik Integration
Authentik is automatically configured with Traefik labels:
- **URL:** `auth.snorlax.me`
- **SSL:** Automatic Let's Encrypt certificates
- **Load Balancer:** Port 9000

### SSO Integration
Use Authentik to provide SSO for other services:
1. Create applications in Authentik admin panel
2. Configure OAuth2/OIDC providers
3. Update service configurations to use Authentik

## 📊 Monitoring

### Health Checks
```bash
# Check container status
docker compose ps

# View logs
docker compose logs -f server
docker compose logs -f worker

# Check database connectivity
cd ../shared-services
./manage.sh psql
\c authentik
\dt  # List tables
```

### Resource Usage
```bash
# Monitor container resources
docker stats authentik-server-1 authentik-worker-1

# Check shared database usage
cd ../shared-services && ./manage.sh status
```

## 🔒 Security

### Database Security
- Uses shared PostgreSQL with dedicated `authentik` database
- Strong randomly generated passwords
- Network isolation through Docker networks

### Authentication Security
- OIDC/OAuth2 protocols
- Multi-factor authentication support
- Session management
- Audit logging

## 🚨 Troubleshooting

### Common Issues

1. **Service won't start:**
   ```bash
   # Check if shared services are running
   cd ../shared-services && ./manage.sh status
   
   # Verify database connection
   docker exec authentik-server-1 python -m authentik.lib.config
   ```

2. **Database connection errors:**
   ```bash
   # Check shared PostgreSQL
   docker exec shared_postgres pg_isready -U postgres
   
   # Verify authentik database exists
   docker exec shared_postgres psql -U postgres -l | grep authentik
   ```

3. **Redis connection errors:**
   ```bash
   # Check shared Redis
   docker exec shared_redis redis-cli -a "password" ping
   
   # Test Redis database 1 (Authentik's database)
   docker exec shared_redis redis-cli -a "password" -n 1 ping
   ```

### Debug Commands
```bash
# Check all containers
docker compose ps -a

# Full logs
docker compose logs

# Check configuration
docker exec authentik-server-1 ak check

# Database status
cd ../shared-services && ./manage.sh psql -c "\l"
```

## 🔄 Backup & Recovery

### Database Backup
Authentik data is automatically included in shared services backups:
```bash
cd ../shared-services
./manage.sh backup
```

### Configuration Backup
```bash
# Backup custom configurations
tar -czf authentik-config-$(date +%Y%m%d).tar.gz .env media/ custom-templates/
```

## 📚 Additional Resources

- **Official Documentation:** https://goauthentik.io/docs/
- **Configuration Reference:** https://goauthentik.io/docs/installation/configuration
- **Integration Guides:** https://goauthentik.io/integrations/

## 🏆 Benefits of Shared Services

- **Resource Efficiency:** ~150MB RAM savings per service
- **Simplified Management:** Single database backup/restore process
- **Better Performance:** Optimized shared database connections
- **Easier Monitoring:** Centralized database health monitoring

---

**Next Steps:** Configure SSO for other services in your stack to take full advantage of Authentik's identity management capabilities.
