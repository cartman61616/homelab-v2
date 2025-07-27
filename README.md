# 🚀 Docker Stack Server - Complete Infrastructure

A comprehensive, security-hardened Docker infrastructure with reverse proxy, monitoring, identity management, and cloud storage, optimized with shared database services for maximum efficiency.

## 📋 Table of Contents

- [🏗️ Architecture Overview](#️-architecture-overview)
- [🗄️ Shared Services](#️-shared-services)
- [📦 Services](#-services)
- [🚀 Quick Start](#-quick-start)
- [🔧 Management](#-management)
- [📊 Monitoring](#-monitoring)
- [🔒 Security](#-security)
- [📖 Documentation](#-documentation)

## 🏗️ Architecture Overview

This Docker stack is built around a **shared services architecture** that maximizes resource efficiency:

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Applications  │    │  Shared Services │    │   Infrastructure│
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ • Authentik     │───►│ • PostgreSQL    │    │ • Traefik       │
│ • Immich        │───►│ • Redis         │    │ • Monitoring    │
│ • Nextcloud     │───►│                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🗄️ Shared Services

**Database consolidation achieved:**
- **Before:** 3 Redis + 2 PostgreSQL = 5 database containers
- **After:** 1 Redis + 1 PostgreSQL + 1 MySQL = 3 database containers
- **Savings:** ~400-600MB RAM + reduced CPU overhead

### Shared PostgreSQL
- **Container:** `shared_postgres`
- **Serves:** Authentik, Immich
- **Databases:** `authentik`, `immich`

### Shared Redis  
- **Container:** `shared_redis`
- **Serves:** All applications (separated by database number)
- **Databases:** 0 (Immich), 1 (Authentik), 2 (Nextcloud)

## 📦 Services

| Service | Description | URL | Database |
|---------|-------------|-----|----------|
| 🔐 **Authentik** | Identity Provider & SSO | `auth.snorlax.me` | Shared PostgreSQL |
| 📸 **Immich** | Photo Management | `photos.snorlax.me` | Shared PostgreSQL + Redis |
| ☁️ **Nextcloud** | File Storage & Sync | `cloud.snorlax.me` | MySQL + Shared Redis |
| 📊 **Grafana** | Monitoring Dashboard | `grafana.snorlax.me` | Local Storage |
| 🎯 **Traefik** | Reverse Proxy | `traefik.snorlax.me` | File-based Config |

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose installed
- Domain name pointing to your server
- Ports 80, 443 open

### 1. Start Shared Services
```bash
cd shared-services
./manage.sh start
```

### 2. Start Core Infrastructure
```bash
# Start reverse proxy
cd traefik && docker compose up -d

# Start monitoring
cd ../monitoring && docker compose up -d
```

### 3. Start Applications
```bash
# Start identity provider
cd ../authentik && docker compose up -d

# Start photo management
cd ../immich && docker compose up -d

# Start file storage
cd ../nextcloud && docker compose up -d
```

## 🔧 Management

### Shared Services Management
```bash
cd shared-services

# Check status
./manage.sh status

# View logs
./manage.sh logs

# Backup all databases
./manage.sh backup

# Connect to databases
./manage.sh psql      # PostgreSQL
./manage.sh redis-cli # Redis
```

### Service Dependencies
**Start Order:**
1. `shared-services` (databases)
2. `traefik` (reverse proxy)
3. `monitoring` (optional)
4. Applications (`authentik`, `immich`, `nextcloud`)

**Stop Order:** Reverse of start order

## 📊 Monitoring

Access monitoring dashboards:
- **Grafana:** http://localhost:3000
- **Prometheus:** http://localhost:9090
- **Traefik Dashboard:** http://localhost:8080

Resource usage tracking:
```bash
# View container resource usage
docker stats

# Monitor shared database usage
cd shared-services && ./manage.sh status
```

## 🔒 Security

### Database Security
- All databases use strong randomly generated passwords
- Services isolated on dedicated Docker networks
- Only authorized applications can access shared databases

### Network Security  
- All external traffic routed through Traefik
- Automatic SSL/TLS certificates via Let's Encrypt
- Internal service communication on isolated networks

### Backup Security
- Database backups stored locally
- Use `./manage.sh backup` for regular backups
- Consider implementing off-site backup storage

## 📖 Documentation

| Component | Documentation |
|-----------|---------------|
| **Shared Services** | `shared-services/README.md` |
| **Authentik** | `authentik/README.md` |
| **Monitoring** | `monitoring/README.md` |
| **Traefik** | `traefik/README.md` |

### Configuration Files
- **Environment Variables:** Each service has its own `.env` file
- **Shared Credentials:** `shared-services/.env`
- **Traefik Config:** `traefik/traefik.yml`
- **Monitoring Config:** `monitoring/prometheus/` and `monitoring/grafana/`

## 🏆 Resource Efficiency

This architecture achieves significant resource savings through shared services:

- **Memory Savings:** ~400-600MB RAM
- **Container Reduction:** 5 → 3 database containers  
- **Management Simplification:** Centralized database administration
- **Backup Simplification:** Single backup process for all databases

## 🚨 Troubleshooting

### Common Issues
1. **Services won't start:** Check if shared services are running first
2. **Database connection errors:** Verify shared services are healthy
3. **Port conflicts:** Ensure no other services use ports 80, 443, 5432, 6379

### Debug Commands
```bash
# Check all container status
docker ps -a

# Check shared services health
cd shared-services && ./manage.sh status

# View service logs
docker compose logs -f [service-name]
```

---

**Need Help?** Check individual service README files or the shared services documentation for detailed configuration and troubleshooting information.
