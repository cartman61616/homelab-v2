# 🚀 Docker Stack Server - Complete Infrastructure

A comprehensive, security-hardened Docker infrastructure with reverse proxy, monitoring, identity management, and cloud storage.

## 📋 Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Services](#services)
- [Security](#security)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
- [Maintenance](#maintenance)
- [Troubleshooting](#troubleshooting)

## 🏗️ Overview

This server provides a complete self-hosted infrastructure including:
- **Identity Provider** (Authentik)
- **Cloud Storage** (Nextcloud)
- **Monitoring Stack** (Prometheus, Grafana, Alertmanager)
- **Reverse Proxy** (Traefik with automatic SSL)
- **Security Hardening** (Firewall, Fail2Ban, Rate limiting)

## 🏛️ Architecture

```
Internet → Cloudflare → Traefik (80/443) → Services
                           ↑
                    Security Layers:
                    - UFW Firewall
                    - Fail2Ban IPS
                    - Rate Limiting
                    - SSL/TLS
                    - Authentication
```

### Network Layout
```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Public Web    │    │  Monitoring      │    │  Internal DB    │
│                 │    │                  │    │                 │
│ • Traefik      │    │ • Prometheus     │    │ • PostgreSQL    │
│ • Grafana      │    │ • Node Exporter  │    │ • MariaDB       │
│ • Authentik    │    │ • cAdvisor       │    │ • Redis         │
│ • Nextcloud    │    │ • Alertmanager   │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

## 🛠️ Services

### Public Services
| Service | URL Pattern | Purpose | Auth Required |
|---------|-------------|---------|---------------|
| **Traefik** | traefik.yourdomain.com | Reverse proxy dashboard | ✅ Basic Auth |
| **Grafana** | grafana.yourdomain.com | Monitoring dashboards | ✅ Built-in |
| **Authentik** | auth.yourdomain.com | Identity provider | ✅ Built-in |
| **Nextcloud** | cloud.yourdomain.com | Cloud storage | ✅ Built-in |

### Admin Services (Protected)
| Service | URL Pattern | Purpose | Auth Required |
|---------|-------------|---------|---------------|
| **Prometheus** | prometheus.yourdomain.com | Metrics collection | ✅ Basic Auth |
| **Alertmanager** | alertmanager.yourdomain.com | Alert management | ✅ Basic Auth |
| **cAdvisor** | cadvisor.yourdomain.com | Container metrics | ✅ Basic Auth |
| **Node Exporter** | node-exporter.yourdomain.com | Host metrics | ✅ Basic Auth |

## 🔒 Security

### Multi-Layer Security Architecture
1. **Network Security** - UFW Firewall (only ports 22, 80, 443 open)
2. **Intrusion Prevention** - Fail2Ban monitoring SSH and HTTP
3. **Application Security** - Rate limiting, security headers, HSTS
4. **Authentication** - Basic auth for admin services, app-level auth for others
5. **Encryption** - TLS 1.2+ only, automatic Let's Encrypt certificates
6. **Isolation** - Docker network segregation, database isolation

### Authentication Layers
| Service | Authentication Method | Notes |
|---------|----------------------|-------|
| **Traefik Dashboard** | Basic Auth | htpasswd protected |
| **Grafana** | Built-in Auth | Username/password login |
| **Authentik** | Built-in Auth | Identity provider setup |
| **Nextcloud** | Built-in Auth | Username/password login |
| **Admin Services** | Basic Auth | Traefik middleware protection |

## 🚀 Quick Start

### Prerequisites
- Ubuntu 22.04+ server
- Docker and Docker Compose installed
- Domain name with Cloudflare DNS management
- Server with public IP address

### 1. DNS Configuration (Cloudflare)
Set up these A records pointing to your server's public IP:

**Option 1: Wildcard Record (Recommended)**
```
Type: A
Name: *
Content: YOUR_SERVER_PUBLIC_IP
Proxy status: DNS only (gray cloud)
TTL: Auto
```

**Option 2: Individual Records**
```
traefik.yourdomain.com → YOUR_SERVER_IP
grafana.yourdomain.com → YOUR_SERVER_IP  
prometheus.yourdomain.com → YOUR_SERVER_IP
auth.yourdomain.com → YOUR_SERVER_IP
cloud.yourdomain.com → YOUR_SERVER_IP
alertmanager.yourdomain.com → YOUR_SERVER_IP
cadvisor.yourdomain.com → YOUR_SERVER_IP
node-exporter.yourdomain.com → YOUR_SERVER_IP
```

**⚠️ Important**: Use "DNS only" (gray cloud) initially for Let's Encrypt certificate generation.

### 2. Find Your Server IP
```bash
curl -4 ifconfig.co
```

### 3. Start Services
```bash
# Start Traefik (reverse proxy)
cd /home/mumbles/docker-stack/traefik
docker compose up -d

# Start Monitoring Stack
cd /home/mumbles/docker-stack/monitoring  
docker compose up -d

# Start Authentik (identity provider)
cd /home/mumbles/docker-stack/authentik
docker compose up -d

# Start Nextcloud (cloud storage)
cd /home/mumbles/docker-stack/nextcloud
docker compose up -d
```

### 4. Verify Setup
```bash
# Check all services are running
docker ps

# Check Traefik routes
curl -s http://localhost:8080/api/http/routers

# Test DNS resolution
nslookup grafana.yourdomain.com

# Check SSL certificates (after DNS propagation)
docker logs traefik --tail=20
```

## ⚙️ Configuration

### Environment Files
Configuration is managed centrally in `~/dotfiles/docker/`:

```
~/dotfiles/docker/
├── traefik/.env          # Reverse proxy config
├── monitoring/.env       # Monitoring stack config  
├── authentik/.env        # Identity provider config
└── nextcloud/.env        # Cloud storage config
```

### Key Configuration Templates

#### Traefik (`~/dotfiles/docker/traefik/.env`)
```env
DOMAIN=yourdomain.com
ACME_EMAIL=admin@yourdomain.com
TRAEFIK_AUTH=username:$apr1$hash...  # Generated htpasswd hash
LOG_LEVEL=INFO
```

#### Monitoring (`~/dotfiles/docker/monitoring/.env`) 
```env
DOMAIN=yourdomain.com
GRAFANA_USER=admin
GRAFANA_PASSWORD=your_secure_password
```

#### Authentik (`~/dotfiles/docker/authentik/.env`)
```env
DOMAIN=yourdomain.com
PG_PASS=generated_secure_password
AUTHENTIK_SECRET_KEY=generated_secret_key
REDIS_PASS=generated_redis_password
```

#### Nextcloud (`~/dotfiles/docker/nextcloud/.env`)
```env
DOMAIN=yourdomain.com
NEXTCLOUD_ADMIN_USER=admin
NEXTCLOUD_ADMIN_PASSWORD=your_secure_password
MYSQL_ROOT_PASSWORD=generated_mysql_password
MYSQL_PASSWORD=generated_mysql_user_password
REDIS_PASSWORD=generated_redis_password
```

### Generate Secure Passwords
```bash
# Generate random passwords
openssl rand -base64 32

# Generate htpasswd hash for Traefik
htpasswd -nb username password
```

## 🔧 Maintenance

### Regular Tasks

#### Daily
```bash
# Check service health
docker ps
sudo fail2ban-client status
```

#### Weekly  
```bash
# Update system packages
sudo apt update && sudo apt upgrade

# Check disk usage
df -h
docker system df
```

#### Monthly
```bash
# Update Docker images
cd /home/mumbles/docker-stack
for dir in traefik monitoring authentik nextcloud; do
  cd $dir && docker compose pull && docker compose up -d && cd ..
done

# Clean unused Docker resources
docker system prune -f
```

### Backup Strategy

#### Critical Data to Backup
1. **Configuration Files**: `~/dotfiles/docker/`
2. **SSL Certificates**: `traefik/letsencrypt/acme.json`
3. **Database Volumes**: Grafana, Authentik, Nextcloud databases
4. **Application Data**: Nextcloud user files

#### Backup Commands
```bash
# Backup databases
docker compose -f authentik/docker-compose.yml exec postgresql \
  pg_dump -U authentik authentik > authentik-backup-$(date +%Y%m%d).sql

docker compose -f nextcloud/docker-compose.yml exec nextcloud-db \
  mysqldump -u nextcloud -p nextcloud > nextcloud-backup-$(date +%Y%m%d).sql

# Backup Docker volumes
docker run --rm -v nextcloud_nextcloud_data:/data \
  -v $(pwd):/backup alpine tar czf /backup/nextcloud-data-$(date +%Y%m%d).tar.gz /data
```

### Log Management

#### View Logs
```bash
# Service logs
docker logs traefik --tail=50
docker logs grafana --tail=50
docker logs prometheus --tail=50

# System security logs
sudo tail -f /var/log/fail2ban.log
sudo tail -f /var/log/ufw.log
```

## 🛡️ Security

### Security Features Implemented
- ✅ **UFW Firewall**: Only essential ports open (22, 80, 443)
- ✅ **Fail2Ban**: Intrusion prevention system
- ✅ **Rate Limiting**: 10 req/min public, 2 req/min admin services
- ✅ **SSL/TLS**: Automatic Let's Encrypt certificates, TLS 1.2+ only
- ✅ **Security Headers**: HSTS, XSS protection, content security policy
- ✅ **Network Isolation**: Services isolated in separate Docker networks
- ✅ **Strong Authentication**: Secure password requirements
- ✅ **Database Security**: Password-protected, network-isolated databases

### Security Monitoring
```bash
# Check firewall status
sudo ufw status verbose

# Check intrusion prevention
sudo fail2ban-client status
sudo fail2ban-client status sshd

# Check banned IPs
sudo fail2ban-client status traefik-auth

# Security headers test
curl -I https://grafana.yourdomain.com | grep -i security
```

### Incident Response
If security breach suspected:
1. **Block malicious IPs**: `sudo ufw deny from <IP>`
2. **Check access logs**: `docker logs traefik --tail=100`
3. **Review Fail2Ban logs**: `sudo tail -100 /var/log/fail2ban.log`
4. **Change passwords**: Update all service credentials
5. **Restart services**: `docker compose restart` in each directory

## 🔍 Troubleshooting

### Common Issues

#### Services Not Accessible
```bash
# Check if containers are running
docker ps

# Check Traefik routes
docker logs traefik --tail=20

# Check DNS resolution
nslookup grafana.yourdomain.com

# Check SSL certificates
docker exec traefik cat /letsencrypt/acme.json | jq
```

#### SSL Certificate Issues
```bash
# Check Let's Encrypt rate limits
docker logs traefik | grep -i "rate limit"

# Reset certificates (careful!)
cd traefik
rm letsencrypt/acme.json
touch letsencrypt/acme.json
chmod 600 letsencrypt/acme.json
docker compose restart traefik
```

#### Performance Issues
```bash
# Check resource usage
docker stats

# Check disk space
df -h
docker system df

# Check memory usage
free -h
```

### Service-Specific Troubleshooting

#### Grafana
```bash
# Reset admin password
docker exec -it grafana grafana-cli admin reset-admin-password newpassword

# Check datasource connectivity
curl -u admin:password http://localhost:3000/api/datasources
```

#### Authentik
```bash
# Check worker status
docker logs authentik-worker-1

# Access management interface
# Go to https://auth.yourdomain.com/if/admin/
```

#### Nextcloud
```bash
# Run occ commands
docker exec -u www-data nextcloud-app php occ status

# Scan files
docker exec -u www-data nextcloud-app php occ files:scan --all
```

### Recovery Procedures

#### Complete System Recovery
```bash
# Stop all services
cd /home/mumbles/docker-stack
for dir in */; do cd "$dir" && docker compose down && cd ..; done

# Start in order
cd traefik && docker compose up -d && sleep 30 && cd ..
cd monitoring && docker compose up -d && cd ..
cd authentik && docker compose up -d && cd ..
cd nextcloud && docker compose up -d && cd ..
```

## 📞 Support

### Documentation Locations
- **General Setup**: `/home/mumbles/docker-stack/README.md` (this file)
- **Security Guide**: `/home/mumbles/docker-stack/traefik/security_summary.md`
- **Cloudflare Setup**: `/home/mumbles/docker-stack/traefik/cloudflare_setup.txt`
- **Individual Services**: Each service directory contains its own README.md

### Useful Commands Reference
```bash
# Service management
docker compose ps                    # Check status
docker compose logs -f [service]     # View logs
docker compose restart [service]     # Restart service
docker compose pull                  # Update images

# System monitoring
sudo systemctl status fail2ban      # Check Fail2Ban
sudo ufw status                      # Check firewall
htop                                # System resources
df -h                               # Disk usage

# Network troubleshooting  
ss -tulpn                           # Open ports
docker network ls                    # Docker networks
nslookup [domain]                   # DNS resolution
```

## 📊 System Requirements

### Minimum Requirements
- **OS**: Ubuntu 22.04 LTS or newer
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 50GB minimum, 100GB+ recommended  
- **CPU**: 2 cores minimum, 4+ cores recommended
- **Network**: Reliable internet connection with static IP

### Recommended Setup
- **OS**: Ubuntu 22.04 LTS (latest)
- **RAM**: 16GB or more
- **Storage**: SSD with 200GB+ available space
- **CPU**: 4+ cores with modern architecture
- **Network**: Dedicated server or VPS with good bandwidth

## 🏷️ Version Information
- **Created**: July 2025
- **Docker Stack Version**: 1.0
- **Traefik**: v3.1
- **Authentik**: 2025.6.4
- **Nextcloud**: Latest Apache
- **Grafana**: Latest
- **Prometheus**: Latest

**Happy self-hosting! 🚀**

---

*Note: Replace `yourdomain.com` with your actual domain name throughout this documentation.*
