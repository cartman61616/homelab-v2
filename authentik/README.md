# Authentik Setup

This directory contains the Docker Compose setup for Authentik, an open-source identity provider.

## Setup Instructions

1. **Start the services:**
   ```bash
   docker-compose up -d
   ```

2. **Check the logs:**
   ```bash
   docker-compose logs -f
   ```

3. **Access Authentik:**
   - Web interface: http://localhost:9000
   - HTTPS interface: https://localhost:9443

4. **Initial Setup:**
   - On first startup, Authentik will create an initial admin user
   - Check the logs for the initial admin credentials:
     ```bash
     docker-compose logs server | grep "Bootstrap"
     ```

## Configuration

- **Database:** PostgreSQL 12
- **Cache:** Redis
- **HTTP Port:** 9000
- **HTTPS Port:** 9443

## Environment Variables

The `.env` file is symlinked from `~/dotfiles/docker/authentik/.env` for centralized configuration management. Key variables:

- `PG_PASS`: Database password (automatically generated)
- `AUTHENTIK_SECRET_KEY`: Secret key for Authentik (automatically generated)
- `COMPOSE_PORT_HTTP`: HTTP port (default: 9000)
- `COMPOSE_PORT_HTTPS`: HTTPS port (default: 9443)

To modify configuration, edit the file at `~/dotfiles/docker/authentik/.env`.

## Email Configuration (Optional)

To enable email functionality, edit `~/dotfiles/docker/authentik/.env` and uncomment/configure the SMTP settings:

```env
AUTHENTIK_EMAIL__HOST=smtp.gmail.com
AUTHENTIK_EMAIL__PORT=587
AUTHENTIK_EMAIL__USERNAME=your_email@gmail.com
AUTHENTIK_EMAIL__PASSWORD=your_app_password
AUTHENTIK_EMAIL__USE_TLS=true
AUTHENTIK_EMAIL__FROM=authentik@yourdomain.com
```

## Commands

- Start: `docker-compose up -d`
- Stop: `docker-compose down`
- View logs: `docker-compose logs -f`
- Restart: `docker-compose restart`
- Update: `docker-compose pull && docker-compose up -d`

## File Structure

```
authentik/
├── docker-compose.yml
├── .env -> ~/dotfiles/docker/authentik/.env  # Symlinked configuration
├── media/                                    # User uploads and media files
├── certs/                                    # SSL certificates
├── custom-templates/                         # Custom templates
└── README.md
```

## Backup

Important directories to backup:

- `./media/` - User uploads and media files
- `~/dotfiles/docker/authentik/.env` - Configuration file
- PostgreSQL data is stored in Docker volumes
- Consider backing up the database regularly:
  ```bash
  docker-compose exec postgresql pg_dump -U authentik authentik > backup.sql
  ```

## Configuration Management

The environment file is managed in the dotfiles repository at `~/dotfiles/docker/authentik/.env`. This allows for:
- Version control of configuration
- Centralized management across multiple deployments
- Easy backup and restoration of settings
