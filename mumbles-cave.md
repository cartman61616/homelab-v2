# Mumbles Cave Server - Comprehensive Summary

*Generated on $(date)*

## Executive Summary

**Server Name**: mumbles-cave  
**Purpose**: Personal homelab server running containerized services  
**OS**: Ubuntu 24.04.2 LTS  
**Domain**: snorlax.me  
**Management**: Docker Compose with Traefik reverse proxy  

## Hardware & System Information

### System Specs
Linux mumbles-cave 6.8.0-64-generic #67-Ubuntu SMP PREEMPT_DYNAMIC Sun Jun 15 20:23:31 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.2 LTS
Release:	24.04
Codename:	noble


### Hardware Details
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
CPU(s):                               4
On-line CPU(s) list:                  0-3
Model name:                           Intel(R) Core(TM) i5-7500T CPU @ 2.70GHz
CPU family:                           6
Thread(s) per core:                   1
Core(s) per socket:                   4
Socket(s):                            1
CPU(s) scaling MHz:                   100%
CPU max MHz:                          800.0000
CPU min MHz:                          800.0000
NUMA node0 CPU(s):                    0-3
Vulnerability Mds:                    Mitigation; Clear CPU buffers; SMT disabled
Vulnerability Mmio stale data:        Mitigation; Clear CPU buffers; SMT disabled

               total        used        free      shared  buff/cache   available
Mem:            31Gi       2.4Gi        17Gi        56Mi        11Gi        28Gi
Swap:          8.0Gi          0B       8.0Gi


### Storage Information
/dev/mapper/ubuntu--vg-ubuntu--lv   98G   23G   71G  25% /
/dev/sda2                          2.0G  193M  1.6G  11% /boot
/dev/sda1                          1.1G  6.2M  1.1G   1% /boot/efi

NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0  73.9M  1 loop /snap/core22/2010
loop1                       7:1    0  73.9M  1 loop /snap/core22/2045
loop2                       7:2    0  50.9M  1 loop /snap/snapd/24718
loop3                       7:3    0  49.3M  1 loop /snap/snapd/24792
sda                         8:0    0 238.5G  0 disk 
├─sda1                      8:1    0     1G  0 part /boot/efi
├─sda2                      8:2    0     2G  0 part /boot
└─sda3                      8:3    0 235.4G  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0   100G  0 lvm  /

## Network Configuration

### Network Interfaces
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    inet 127.0.0.1/8 scope host lo
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    inet 192.168.0.213/24 metric 100 brd 192.168.0.255 scope global dynamic enp0s31f6
3: wlp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
275: br-d388fee5ff5b: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.23.0.1/16 brd 172.23.255.255 scope global br-d388fee5ff5b
288: br-6f416ded687e: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.24.0.1/16 brd 172.24.255.255 scope global br-6f416ded687e
4178: veth27e8157@if4177: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
120: br-35cf89ee97ae: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.22.0.1/16 brd 172.22.255.255 scope global br-35cf89ee97ae
1924: veth91d1b43@if1923: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d388fee5ff5b state UP group default 
1930: veth6d0539f@if1929: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
1932: veth662ba32@if1931: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
1716: vetha382134@if1715: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
1976: veth8e3a3a7@if1975: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-6f416ded687e state UP group default 
1978: veth50324b6@if1977: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
1980: veth2adf817@if1979: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-6f416ded687e state UP group default 
1982: veth4928704@if1981: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
4550: vethaecef25@if4549: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
4552: veth6b98e24@if4551: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
4554: veth684ffc4@if4553: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
1738: vethf233153@if1737: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
4556: veth0b6b25d@if4555: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
1740: vetha30bc59@if1739: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
4558: veth081e770@if4557: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
1742: vethd25912f@if1741: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
1744: veth96fa8e1@if1743: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
1746: vetha8720b4@if1745: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
1748: vethc46b2c4@if1747: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
1750: veth9ff91cb@if1749: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
1752: veth1fc6e49@if1751: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
1753: br-13756d193a47: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.25.0.1/16 brd 172.25.255.255 scope global br-13756d193a47
1755: veth4e6d258@if1754: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
1759: vethad4bfd7@if1758: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
1760: br-f8c520b1122d: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.26.0.1/16 brd 172.26.255.255 scope global br-f8c520b1122d
1762: veth0f0cca3@if1761: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
234: br-d36e83b06538: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    inet 172.21.0.1/16 brd 172.21.255.255 scope global br-d36e83b06538

### DNS Configuration
# This is /run/systemd/resolve/stub-resolv.conf managed by man:systemd-resolved(8).
# Do not edit.
#
# This file might be symlinked as /etc/resolv.conf. If you're looking at
# /etc/resolv.conf and seeing this text, you have followed the symlink.
#
# This is a dynamic resolv.conf file for connecting local clients to the
# internal DNS stub resolver of systemd-resolved. This file lists all
# configured search domains.
#
# Run "resolvectl status" to see details about the uplink DNS servers
# currently in use.
#
# Third party programs should typically not access this file directly, but only
# through the symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a
# different way, replace this symlink by a static file or a different symlink.
#
# See man:systemd-resolved.service(8) for details about the supported modes of
# operation for /etc/resolv.conf.

nameserver 127.0.0.53
options edns0 trust-ad
search localdomain

### Domain Setup
- **Primary Domain**: snorlax.me
- **DNS Provider**: Cloudflare
- **SSL/TLS**: Let's Encrypt via Traefik
- **Access Method**: Direct IP + planned Cloudflare Tunnel

## Docker Infrastructure

### Container Overview
NAMES                     IMAGE                                                STATUS                            PORTS
traefik                   traefik:v3.1                                         Up 15 minutes                     0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp, 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp
nextcloud-app             nextcloud:apache                                     Up 2 hours                        80/tcp
nextcloud-db              mariadb:11.0                                         Up 2 hours                        3306/tcp
authentik-server-1        ghcr.io/goauthentik/server:2025.6.4                  Up 2 hours (healthy)              0.0.0.0:9000->9000/tcp, :::9000->9000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp
authentik-worker-1        ghcr.io/goauthentik/server:2025.6.4                  Restarting (1) 26 seconds ago     
immich_server             ghcr.io/immich-app/immich-server:release             Up 4 seconds (health: starting)   2283/tcp, 0.0.0.0:2283->3001/tcp, [::]:2283->3001/tcp
immich_machine_learning   ghcr.io/immich-app/immich-machine-learning:release   Up 2 hours (healthy)              
immich_microservices      ghcr.io/immich-app/immich-server:release             Up 1 second (health: starting)    2283/tcp
shared_postgres           postgres:16-alpine                                   Up 2 hours (healthy)              0.0.0.0:5432->5432/tcp, :::5432->5432/tcp
shared_redis              redis:7-alpine                                       Up 2 hours (healthy)              0.0.0.0:6379->6379/tcp, :::6379->6379/tcp
alertmanager              prom/alertmanager:latest                             Up 14 hours                       0.0.0.0:9093->9093/tcp, :::9093->9093/tcp
grafana                   grafana/grafana:latest                               Up 14 hours                       0.0.0.0:3000->3000/tcp, :::3000->3000/tcp
prometheus                prom/prometheus:latest                               Up 14 hours                       0.0.0.0:9090->9090/tcp, :::9090->9090/tcp
loki                      grafana/loki:latest                                  Up 14 hours                       0.0.0.0:3100->3100/tcp, :::3100->3100/tcp
node-exporter             prom/node-exporter:latest                            Up 14 hours                       0.0.0.0:9100->9100/tcp, :::9100->9100/tcp
cadvisor                  gcr.io/cadvisor/cadvisor:latest                      Up 14 hours (healthy)             0.0.0.0:8081->8080/tcp, [::]:8081->8080/tcp
promtail                  grafana/promtail:latest                              Up 15 hours                       

### Docker Networks
NETWORK ID     NAME                    DRIVER    SCOPE
d388fee5ff5b   authentik_authentik     bridge    local
791ffb29227a   bridge                  bridge    local
27cea5973a8e   host                    host      local
f8c520b1122d   immich_immich           bridge    local
d36e83b06538   monitoring_monitoring   bridge    local
6f416ded687e   nextcloud_nextcloud     bridge    local
5ced32b3ad09   none                    null      local
13756d193a47   shared-services         bridge    local
35cf89ee97ae   traefik                 bridge    local

### Docker Volumes
DRIVER    VOLUME NAME
local     immich_model-cache
local     monitoring_alertmanager_data
local     monitoring_grafana_data
local     monitoring_loki_data
local     monitoring_prometheus_data
local     nextcloud-aio_nextcloud_aio_mastercontainer
local     nextcloud_aio_mastercontainer
local     nextcloud_db_data
local     nextcloud_nextcloud_data
local     shared-services_postgres_data
local     shared-services_redis_data

## Service Architecture

### 🌐 Reverse Proxy Layer
**Traefik v3.1**
- **Role**: Central reverse proxy and load balancer
- **Features**: Automatic SSL, security headers, rate limiting
- **Dashboard**: http://localhost:8080/dashboard/
- **Configuration**: Dynamic via Docker labels + static file
- **Status**: ✅ Running (some DNS issues being resolved)

### 🔐 Authentication & Identity
**Authentik**
- **Role**: Single Sign-On (SSO) and identity provider
- **URL**: https://auth.snorlax.me (planned)
- **Integration**: OAuth2/OIDC for other services
- **Status**: 🔄 Configured, DNS resolution pending

### ☁️ Cloud Storage
**Nextcloud**
- **Role**: Personal cloud storage and collaboration
- **URL**: https://cloud.snorlax.me (planned)
- **Features**: File sync, calendar, contacts, office suite
- **Database**: PostgreSQL
- **Status**: 🔄 Running, external access pending

### 📊 Monitoring Stack
**Prometheus + Grafana + Alertmanager**
- **Prometheus**: Metrics collection and storage
- **Grafana**: Dashboards and visualization
- **Alertmanager**: Alert management and notifications
- **Node Exporter**: System metrics
- **cAdvisor**: Container metrics
- **URLs**: 
  - Grafana: https://grafana.snorlax.me (planned)
  - Prometheus: https://prometheus.snorlax.me (planned)
- **Status**: ✅ Running internally

### 📷 Photo Management
**Immich**
- **Role**: Google Photos alternative
- **Features**: AI-powered photo organization, face recognition
- **Database**: PostgreSQL
- **Status**: 🔄 Configured

### 🗄️ Shared Services
**PostgreSQL Database**
- **Role**: Shared database for multiple services
- **Services**: Nextcloud, Authentik, Immich
- **Backup**: Automated via scripts
- **Status**: ✅ Running

**Redis Cache**
- **Role**: Caching and session storage
- **Used by**: Nextcloud, Authentik
- **Status**: ✅ Running

## Security Configuration

### 🛡️ Current Security Measures
- **Container Isolation**: All services dockerized
- **Reverse Proxy**: Traefik handling all external access
- **SSL/TLS**: Let's Encrypt certificates (staging mode currently)
- **Security Headers**: HSTS, XSS protection, content type sniffing prevention
- **Rate Limiting**: Configured per service type
- **Basic Authentication**: On admin interfaces

### 🚨 Security Recommendations Available
Located in `~/notes/security_assessment_and_recommendations.md`:
- UFW Firewall setup
- fail2ban intrusion prevention
- SSH hardening
- Docker security hardening
- Backup encryption
- Monitoring and alerting

## File System Organization

### Directory Structure
```
/home/mumbles/
├── docker-stack/           # Main application stack
│   ├── authentik/         # Identity provider
│   ├── immich/            # Photo management
│   ├── monitoring/        # Prometheus, Grafana stack
│   ├── nextcloud/         # Cloud storage
│   ├── shared-services/   # PostgreSQL, Redis
│   ├── traefik/           # Reverse proxy
│   ├── scripts/           # Management scripts
│   └── mumbles-cave.md    # Server documentation
├── notes/                 # Documentation and guides
├── dotfiles/              # Configuration files
└── workspace/             # Development area
```

### Management Scripts
- **System Cleanup**: `scripts/system-cleanup.sh`
- **Automation Management**: `scripts/manage-automation.sh`
- **Docker Compose Sync**: `scripts/docker-compose-with-sync.sh`
- **1Password Integration**: `scripts/1password-helper.sh`

## Backup Strategy

### Current Backup Status
- **Configuration**: Git repository for docker-stack
- **Data Volumes**: Manual backup capability
- **Secrets**: 1Password integration for sensitive data

### 📋 Recommended Backup Implementation
Available in `~/notes/backup_setup.sh`:
- Automated encrypted backups using restic
- Daily incremental backups
- Retention policy: 7 daily, 4 weekly, 12 monthly
- Container-aware backup process

## Current Issues & Resolution Status

### ✅ Resolved Issues
- **Traefik Middleware Errors**: Fixed missing middleware definitions
- **Container Communication**: All services properly networked
- **SSL Configuration**: Staging certificates working
- **File Organization**: Documentation moved to ~/notes/

### 🔄 In Progress
- **DNS Resolution**: Only traefik.snorlax.me resolving currently
  - Solution: Add Cloudflare A records for all subdomains
- **SSL Certificates**: Using staging certs pending DNS fix
  - Solution: Switch to production after DNS resolution

### 📋 Planned Improvements
- **Cloudflare Tunnel**: Eliminate port forwarding requirement
- **Security Hardening**: Implement comprehensive security measures
- **Backup Automation**: Scheduled encrypted backups
- **Monitoring Alerts**: Email/SMS notifications

## Access Methods

### Current Access
- **SSH**: Direct server access via SSH key
- **Traefik Dashboard**: http://localhost:8080/dashboard/
- **Local Services**: Via Docker network IPs
- **Port Forwarding**: SSH tunneling for remote access

### Planned Access (Post-DNS Fix)
- **Public Services**: https://domain.snorlax.me
- **Admin Services**: Authenticated access via Traefik
- **Secure Access**: Cloudflare Tunnel (no port forwarding needed)

## Maintenance Schedule

### Daily
- Container health monitoring
- Log review (when implemented)

### Weekly  
- System updates
- Docker image updates
- Security log review

### Monthly
- Backup verification
- Security configuration review
- Performance optimization

## Resource Utilization

### Current Usage
 16:23:43 up 2 days, 14:43,  2 users,  load average: 9.33, 8.89, 8.65

               total        used        free      shared  buff/cache   available
Mem:            31Gi       2.4Gi        17Gi        56Mi        11Gi        28Gi
Swap:          8.0Gi          0B       8.0Gi

Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              3.2G  3.0M  3.2G   1% /run
efivarfs                           256K  205K   47K  82% /sys/firmware/efi/efivars
/dev/mapper/ubuntu--vg-ubuntu--lv   98G   23G   71G  25% /
tmpfs                               16G     0   16G   0% /dev/shm

### Docker Resource Usage
NAME                      CPU %     MEM USAGE / LIMIT     NET I/O
traefik                   0.03%     48.62MiB / 31.08GiB   177kB / 94.7kB
nextcloud-app             0.00%     21.31MiB / 31.08GiB   67.1kB / 0B
nextcloud-db              0.01%     91.15MiB / 31.08GiB   1.22kB / 0B
authentik-server-1        118.64%   34.26MiB / 31.08GiB   9.95MB / 8.14MB
authentik-worker-1        0.00%     0B / 0B               0B / 0B
immich_server             109.15%   106.4MiB / 31.08GiB   1.84kB / 0B
immich_machine_learning   0.20%     199.5MiB / 31.08GiB   1.74kB / 0B
immich_microservices      111.07%   73.57MiB / 31.08GiB   1.03kB / 0B
shared_postgres           9.09%     53.59MiB / 31.08GiB   8.92MB / 18MB
shared_redis              2.21%     3.637MiB / 31.08GiB   9.76MB / 97.6MB
alertmanager              0.24%     22.82MiB / 31.08GiB   33.9MB / 768kB
grafana                   0.38%     91.51MiB / 31.08GiB   3.41MB / 95.2MB
prometheus                0.03%     541.4MiB / 31.08GiB   1.21GB / 62.5MB
loki                      1.32%     59.91MiB / 31.08GiB   4.12MB / 902kB
node-exporter             0.00%     10.14MiB / 31.08GiB   2.4MB / 55.5MB
cadvisor                  5.45%     78.79MiB / 31.08GiB   17.5MB / 1.07GB
promtail                  0.80%     23.62MiB / 31.08GiB   918kB / 4.17MB

## Contact & Support Information

- **Administrator**: mumbles
- **Email**: cartman61616@gmail.com  
- **Documentation**: ~/notes/ directory
- **Repository**: Git repository in docker-stack/
- **Secrets Management**: 1Password integration

## Quick Reference Commands

### Service Management
```bash
# View all containers
docker ps -a

# Restart specific service
docker compose -f docker-stack/SERVICE/docker-compose.yml restart

# View logs
docker logs CONTAINER_NAME

# Access Traefik dashboard
curl -u "mumbles:PASSWORD" http://localhost:8080/dashboard/
```

### System Information
```bash
# System status
~/docker-stack/scripts/system-cleanup.sh status

# Container stats
docker stats

# Network information
docker network ls
```

### Security
```bash
# Firewall status (when implemented)
sudo ufw status

# fail2ban status (when implemented)  
sudo fail2ban-client status

# System security check
~/notes/security_hardening_quick_setup.sh
```

## Implementation Roadmap

### Phase 1: Core Stability (This Week)
- [ ] Fix DNS records in Cloudflare
- [ ] Switch to production SSL certificates
- [ ] Implement basic security hardening
- [ ] Set up automated backups

### Phase 2: Security & Access (Next Week)  
- [ ] Configure Cloudflare Tunnel
- [ ] Implement comprehensive security measures
- [ ] Set up monitoring alerts
- [ ] Document all procedures

### Phase 3: Optimization (Next Month)
- [ ] Performance tuning
- [ ] Advanced monitoring
- [ ] Disaster recovery testing
- [ ] Service expansion planning

---

**Status**: Server operational with container services running. Primary focus: DNS resolution and security hardening.

**Last Updated**: $(date)
