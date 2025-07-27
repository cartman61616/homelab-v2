# ☁️ Nextcloud File Storage & Collaboration

Nextcloud is a self-hosted file storage and collaboration platform that provides secure file sharing, calendaring, contacts, and productivity tools for your personal or organizational needs.

## 🏗️ Architecture

Nextcloud uses a **hybrid database approach** with shared caching services:

```
┌─────────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     Nextcloud       │    │ Local Database  │    │ Shared Services │
├─────────────────────┤    ├─────────────────┤    ├─────────────────┤
│ • Web Interface     │───►│ • MariaDB 11.0  │    │ • Redis Cache   │
│ • File Management   │───►│ • Local Storage │───►│                 │
│ • Apps & Plugins    │    │                 │    │                 │
└─────────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📦 Components

- **nextcloud-app**: Main Nextcloud application server (Apache-based)
- **nextcloud-db**: Dedicated MariaDB 11.0 database for Nextcloud data
- **shared_redis**: Shared Redis instance for session and file locking cache

## 🚀 Quick Start

1. **Start Nextcloud:**
   ```bash
   docker compose up -d
   ```

2. **Access the web interface:**
   - URL: `https://cloud.yourdomain.com` (or `https://cloud.localhost` for local)
   - Login with admin credentials from your `.env` file

3. **Verify services:**
   ```bash
   docker compose ps
   docker compose logs -f nextcloud-app
   ```

## 🔧 Configuration

### Environment Variables

Key variables in your `.env` file:

```bash
# Database Configuration
MYSQL_ROOT_PASSWORD=your_secure_root_password
MYSQL_PASSWORD=your_nextcloud_db_password

# Admin Account
NEXTCLOUD_ADMIN_USER=admin
NEXTCLOUD_ADMIN_PASSWORD=your_admin_password

# Domain Configuration
DOMAIN=yourdomain.com

# Shared Redis (managed by shared-services)
SHARED_REDIS_PASSWORD=your_redis_password
```

### Directory Structure

```
nextcloud/
├── config/          # Nextcloud configuration files
├── custom_apps/     # Custom/additional apps
├── data/           # User data storage (mounted from host)
├── themes/         # Custom themes
└── docker-compose.yml
```

### Persistent Storage

- **nextcloud_data**: Application files and core data
- **db_data**: MariaDB database files
- **./data**: User files (mounted to host for direct access)
- **./config**: Configuration files (mounted to host for persistence)

## 🔒 Security Features

### Traefik Integration

- **HTTPS**: Automatic SSL certificates via Let's Encrypt
- **Headers**: Security headers for enhanced protection
- **CalDAV/CardDAV**: Proper .well-known redirects for calendar/contacts sync

### Access Control

- **Trusted Domains**: Configured for your specific domain
- **Proxy Trust**: Configured to trust Traefik reverse proxy
- **Frame Options**: Set to SAMEORIGIN for security

## 📱 Features & Apps

### Built-in Features

- **File Storage**: Secure file upload, download, and sharing
- **Sync**: Desktop and mobile clients for file synchronization
- **Collaboration**: Real-time document editing and sharing
- **Calendar & Contacts**: Built-in CalDAV and CardDAV support
- **Gallery**: Photo and video management with automatic thumbnails

### Popular Apps

Install additional apps through the Nextcloud app store:

- **OnlyOffice**: Advanced document editing
- **Deck**: Kanban-style project management
- **Talk**: Video calling and chat
- **Mail**: Email client integration
- **Notes**: Simple note-taking
- **Tasks**: Todo list management

## 🔧 Management Commands

### Maintenance Mode

```bash
# Enable maintenance mode
docker compose exec nextcloud-app php occ maintenance:mode --on

# Disable maintenance mode
docker compose exec nextcloud-app php occ maintenance:mode --off
```

### User Management

```bash
# List users
docker compose exec nextcloud-app php occ user:list

# Create user
docker compose exec nextcloud-app php occ user:add --password-from-env newuser

# Reset user password
docker compose exec nextcloud-app php occ user:resetpassword username
```

### File Operations

```bash
# Scan files for changes
docker compose exec nextcloud-app php occ files:scan --all

# Clean up file cache
docker compose exec nextcloud-app php occ files:cleanup
```

### Database Operations

```bash
# Database backup
docker compose exec nextcloud-db mysqldump -u root -p nextcloud > nextcloud_backup.sql

# Database maintenance
docker compose exec nextcloud-app php occ db:add-missing-indices
docker compose exec nextcloud-app php occ db:convert-filecache-bigint
```

## 📊 Monitoring Integration

Nextcloud metrics are automatically collected by the monitoring stack:

- **Container metrics**: Via cAdvisor
- **Application logs**: Via Promtail → Loki
- **Database metrics**: Via database exporters

## 🔍 Troubleshooting

### Common Issues

1. **"Trusted domain" error:**
   ```bash
   docker compose exec nextcloud-app php occ config:system:set trusted_domains 1 --value=cloud.yourdomain.com
   ```

2. **Redis connection issues:**
   ```bash
   # Check Redis connectivity
   docker compose exec nextcloud-app php occ config:system:get redis
   ```

3. **File permissions:**
   ```bash
   # Fix file permissions
   docker compose exec nextcloud-app chown -R www-data:www-data /var/www/html
   ```

### Log Access

```bash
# Nextcloud application logs
docker compose logs -f nextcloud-app

# Database logs
docker compose logs -f nextcloud-db

# Nextcloud system logs
docker compose exec nextcloud-app tail -f /var/www/html/data/nextcloud.log
```

## 🔄 Backup Strategy

### Recommended Backup

1. **Database backup:**
   ```bash
   docker compose exec nextcloud-db mysqldump -u root -p nextcloud > backup/nextcloud_db_$(date +%Y%m%d).sql
   ```

2. **Configuration backup:**
   ```bash
   tar -czf backup/nextcloud_config_$(date +%Y%m%d).tar.gz config/
   ```

3. **User data backup:**
   ```bash
   tar -czf backup/nextcloud_data_$(date +%Y%m%d).tar.gz data/
   ```

## 🌐 External Access & Sync

### Desktop Clients

Download Nextcloud desktop clients:
- **Windows/Mac/Linux**: https://nextcloud.com/install/#install-clients

### Mobile Apps

- **Android**: Nextcloud app from Google Play Store
- **iOS**: Nextcloud app from App Store

### WebDAV Access

- **URL**: `https://cloud.yourdomain.com/remote.php/dav/files/USERNAME/`
- **CalDAV**: `https://cloud.yourdomain.com/remote.php/dav/calendars/USERNAME/`
- **CardDAV**: `https://cloud.yourdomain.com/remote.php/dav/addressbooks/users/USERNAME/`

## 📖 Additional Resources

- [Nextcloud Documentation](https://docs.nextcloud.com/)
- [Nextcloud Apps Store](https://apps.nextcloud.com/)
- [Admin Manual](https://docs.nextcloud.com/server/latest/admin_manual/)
- [User Manual](https://docs.nextcloud.com/server/latest/user_manual/)

---

*This Nextcloud instance is part of your integrated Docker stack with automatic HTTPS, monitoring, and shared caching services.*
