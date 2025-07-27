# Mumbles Cave Server - Comprehensive Summary

*Generated on Sun Jul 27 04:30:04 PM UTC 2025*

## Executive Summary

**Server Name**: mumbles-cave  
**Purpose**: Personal homelab server running containerized services  
**OS**: Ubuntu 24.04.2 LTS  
**Domain**: snorlax.me  
**Management**: Docker Compose with Traefik reverse proxy  

## Hardware & System Information

### System Specs
```
Linux mumbles-cave 6.8.0-64-generic #67-Ubuntu SMP PREEMPT_DYNAMIC Sun Jun 15 20:23:31 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

Distribution: Ubuntu 24.04.2 LTS (Noble)
Uptime: 2 days, 14+ hours
Load Average: 8.19, 8.78, 8.53
```

### Hardware Details
```
Architecture: x86_64
CPU: Intel(R) Core(TM) i5-7500T @ 2.70GHz
Cores: 4 cores, 1 thread per core
Memory: 31GB total, 2.4GB used, 17GB free
Swap: 8GB total, 0GB used
```

### Storage Information
```
Filesystem                         Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv   98G   23G   71G  25% /
/dev/sda2                          2.0G  193M  1.6G  11% /boot
/dev/sda1                          1.1G  6.2M  1.1G   1% /boot/efi
```

## Network Configuration

### Network Interfaces
- **Primary Interface**: Connected with DHCP
- **Docker Networks**: Multiple isolated networks for services
- **External IP**: 108.92.163.162
- **DNS**: Cloudflare (1.1.1.1, 1.0.0.1)

### Domain Setup
- **Primary Domain**: snorlax.me
- **DNS Provider**: Cloudflare
- **SSL/TLS**: Let's Encrypt via Traefik
- **Current Resolution**: Only traefik.snorlax.me resolving
- **Status**: ⚠️ Additional DNS A records needed

## Docker Infrastructure

### Container Overview
| Service | Image | Status | Ports |
|---------|-------|--------|-------|
| traefik | traefik:v3.1 | ✅ Running | 80, 443, 8080 |
| grafana | grafana/grafana | ✅ Running | 3000 |
| prometheus | prom/prometheus | ✅ Running | 9090 |
| nextcloud-app | nextcloud:apache | ✅ Running | 80 |
| immich_server | ghcr.io/immich-app/immich-server | ✅ Running | 3001 |
| authentik-server | goauthentik.io/server | ✅ Running | 9000, 9443 |
| postgres | postgres:13 | ✅ Running | 5432 |
| redis | redis:alpine | ✅ Running | 6379 |

### Docker Networks
- **traefik**: Main reverse proxy network (172.22.0.0/16)
- **monitoring_monitoring**: Monitoring stack network
- **nextcloud_default**: Nextcloud services network
- **authentik_default**: Authentik services network
- **immich_default**: Immich services network

## Service Architecture

### 🌐 Reverse Proxy Layer
**Traefik v3.1**
- **Role**: Central reverse proxy and load balancer
- **Features**: Automatic SSL, security headers, rate limiting
- **Dashboard**: http://localhost:8080/dashboard/
- **Configuration**: Dynamic via Docker labels + static file
- **Status**: ✅ Running (middleware errors resolved)

### 🔐 Authentication & Identity
**Authentik**
- **Role**: Single Sign-On (SSO) and identity provider
- **URL**: https://auth.snorlax.me (pending DNS)
- **Integration**: OAuth2/OIDC for other services
- **Status**: 🔄 Running, DNS resolution needed

### ☁️ Cloud Storage
**Nextcloud**
- **Role**: Personal cloud storage and collaboration
- **URL**: https://cloud.snorlax.me (pending DNS)
- **Features**: File sync, calendar, contacts, office suite
- **Database**: PostgreSQL
- **Status**: 🔄 Running, external access pending

### 📊 Monitoring Stack
**Prometheus + Grafana + Alertmanager**
- **Prometheus**: Metrics collection (http://172.22.0.4:9090)
- **Grafana**: Dashboards and visualization (http://172.22.0.3:3000)
- **Alertmanager**: Alert management and notifications
- **Node Exporter**: System metrics collection
- **cAdvisor**: Container metrics collection
- **Status**: ✅ Running internally, external DNS needed

### 📷 Photo Management
**Immich**
- **Role**: Google Photos alternative
- **Features**: AI-powered photo organization, face recognition
- **Database**: PostgreSQL
- **Status**: 🔄 Configured and running

### 🗄️ Shared Services
**PostgreSQL Database**
- **Role**: Shared database for multiple services
- **Services**: Nextcloud, Authentik, Immich
- **Status**: ✅ Running

**Redis Cache**
- **Role**: Caching and session storage
- **Used by**: Nextcloud, Authentik
- **Status**: ✅ Running

## Security Configuration

### 🛡️ Current Security Measures
- **Container Isolation**: All services dockerized
- **Reverse Proxy**: Traefik handling all external access
- **SSL/TLS**: Let's Encrypt certificates (staging mode for testing)
- **Security Headers**: HSTS, XSS protection, content type sniffing prevention
- **Rate Limiting**: Configured per service type (20 req/min burst, 10 avg)
- **Basic Authentication**: On admin interfaces
- **Middleware Security**: Chain middlewares for admin and public services

### 🚨 Security Recommendations
Available security hardening options:
- **UFW Firewall**: System-level firewall configuration
- **fail2ban**: Intrusion prevention system
- **SSH Hardening**: Key-only authentication, restricted access
- **Docker Security**: Daemon hardening and container restrictions
- **Backup Encryption**: Automated encrypted backups with restic
- **Network Security**: IP whitelisting and geo-blocking
- **Monitoring**: Security event logging and alerting

## File System Organization

### Directory Structure
```
/home/mumbles/
├── docker-stack/           # Main application stack
│   ├── authentik/         # Identity provider configs
│   ├── immich/            # Photo management
│   ├── monitoring/        # Prometheus, Grafana stack
│   ├── nextcloud/         # Cloud storage
│   ├── shared-services/   # PostgreSQL, Redis
│   ├── traefik/           # Reverse proxy configs
│   ├── scripts/           # Management and automation scripts
│   └── mumbles-cave.md    # This documentation
├── notes/                 # Security guides and documentation
├── dotfiles/              # System configuration files
└── workspace/             # Development and temporary work area
```

### Management Scripts
- **System Cleanup**: `scripts/system-cleanup.sh`
- **Automation Management**: `scripts/manage-automation.sh`
- **Docker Compose Sync**: `scripts/docker-compose-with-sync.sh`
- **1Password Integration**: `scripts/1password-helper.sh`
- **Backup Management**: `scripts/backup-secrets.sh`

## Current Issues & Resolution Status

### ✅ Resolved Issues
- **Traefik Middleware Errors**: Fixed missing middleware definitions in dynamic.yml
- **Container Communication**: All services properly networked via Traefik
- **SSL Configuration**: Staging certificates working, ready for production
- **File Organization**: Documentation organized, directory cleaned

### 🔄 In Progress
- **DNS Resolution**: Only traefik.snorlax.me resolving currently
  - **Root Cause**: Missing DNS A records in Cloudflare
  - **Solution**: Add A records for all subdomains (grafana, prometheus, auth, cloud, etc.)
  - **Status**: Instructions provided, awaiting DNS configuration

- **SSL Certificates**: Using staging certs to avoid rate limits
  - **Solution**: Switch to production after DNS resolution
  - **Script**: Available in `~/notes/fix_traefik_production.sh`

### 📋 Planned Improvements
- **Cloudflare Tunnel**: Eliminate port forwarding requirement
- **Security Hardening**: Implement comprehensive security measures
- **Backup Automation**: Scheduled encrypted backups
- **Monitoring Alerts**: Email/SMS notifications for system events

## Access Methods

### Current Access Options
- **SSH**: Direct server access via SSH key authentication
- **Traefik Dashboard**: http://localhost:8080/dashboard/ (with basic auth)
- **Local Services**: Via internal Docker network IPs
- **SSH Tunneling**: Port forwarding for secure remote access

### Planned Access (Post-DNS Configuration)
- **Public Services**: https://service.snorlax.me
- **Admin Services**: Authenticated access via Traefik + Authentik
- **Secure Access**: Cloudflare Tunnel (no router port forwarding needed)

### Zero Port Forwarding Solutions Available
- **Cloudflare Tunnel**: Secure tunneling without opening router ports
- **Tailscale VPN**: Mesh VPN for private access
- **SSH Tunneling**: Secure port forwarding for specific services

## Resource Utilization

### Current System Load
```
Uptime: 2 days, 14:16 hours
Load Average: 8.19, 8.78, 8.53 (high load detected)
Memory: 31GB total, 2.4GB used (8%), 28GB available
Storage: 98GB total, 23GB used (25%), 71GB available
```

### Container Resource Usage
All containers running within normal parameters. High system load may indicate:
- Active image processing (Immich)
- Database operations
- Monitoring data collection

## Implementation Roadmap

### Phase 1: Core Stability (This Week)
- [ ] **Fix DNS records** in Cloudflare for all subdomains
- [ ] **Switch to production SSL** certificates via Traefik
- [ ] **Implement basic security hardening** (UFW, fail2ban)
- [ ] **Set up automated backups** with encryption

### Phase 2: Security & Access (Next Week)  
- [ ] **Configure Cloudflare Tunnel** for secure access
- [ ] **Comprehensive security implementation** (SSH hardening, Docker security)
- [ ] **Set up monitoring alerts** and notifications
- [ ] **Document all procedures** and create runbooks

### Phase 3: Optimization (Next Month)
- [ ] **Performance tuning** and resource optimization
- [ ] **Advanced monitoring** with custom dashboards
- [ ] **Disaster recovery testing** and procedures
- [ ] **Service expansion planning** (additional applications)

## Quick Reference Commands

### Service Management
```bash
# View all containers
docker ps -a

# Restart specific service stack
docker compose -f SERVICE/docker-compose.yml restart

# View service logs
docker logs CONTAINER_NAME -f

# Access Traefik dashboard
curl -u "mumbles:PASSWORD" http://localhost:8080/dashboard/

# Check Traefik routes
curl -s http://localhost:8080/api/http/routers | jq -r '.[].name'
```

### System Monitoring
```bash
# System status overview
~/docker-stack/scripts/system-cleanup.sh

# Real-time container stats
docker stats

# Network information
docker network ls
docker network inspect traefik

# Storage usage
df -h
docker system df
```

### Troubleshooting
```bash
# Check DNS resolution
dig +short traefik.snorlax.me
nslookup grafana.snorlax.me

# Test SSL certificates
curl -I https://traefik.snorlax.me
openssl s_client -connect traefik.snorlax.me:443

# Container health checks
docker inspect CONTAINER_NAME | jq '.[0].State.Health'
```

## Support & Documentation

### Key Resources
- **Main Documentation**: This file (`mumbles-cave.md`)
- **Security Guides**: `~/notes/security_assessment_and_recommendations.md`
- **Setup Scripts**: `~/notes/` directory with automated setup tools
- **Cloudflare Setup**: `~/notes/setup_cloudflare_tunnel.sh`
- **Backup Configuration**: `~/notes/backup_setup.sh`

### Contact Information
- **Administrator**: mumbles
- **Email**: cartman61616@gmail.com
- **Server**: mumbles-cave (Ubuntu 24.04.2 LTS)
- **Domain**: snorlax.me
- **Repository**: Git repository in `/home/mumbles/docker-stack/`

---

**Current Status**: Server operational with all core services running. Primary focus areas: DNS configuration completion and security hardening implementation.

**Next Actions**: 
1. Configure DNS A records in Cloudflare
2. Switch SSL to production certificates  
3. Implement security hardening measures
4. Set up Cloudflare Tunnel for secure access

**Last Updated**: 2025-07-27 16:30:09 UTC
