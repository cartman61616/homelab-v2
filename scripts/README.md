# 🔐 1Password Integration for Docker Stack

This directory contains scripts for managing environment file secrets using 1Password CLI.

## 🚀 Quick Start

### Basic Commands

```bash
# Check integration status
./scripts/secrets status

# Sync all environment files from 1Password
./scripts/secrets sync --force

# List all secrets in 1Password vault
./scripts/secrets list

# Backup current secrets to 1Password
./scripts/secrets backup
```

### Service-Specific Operations

```bash
# Sync only one service
./scripts/secrets sync --service traefik --force

# Target specific services
./scripts/secrets sync --service nextcloud
```

## 📁 File Structure

```
scripts/
├── secrets                    # Main CLI wrapper
├── 1password-helper.sh       # Comprehensive 1Password manager
├── backup-secrets.sh         # Initial backup script
├── sync-envs.sh              # Basic sync script
└── README.md                 # This file
```

## 🔧 How It Works

### 1. Template Files
Each service has a `.env.template` file in `/home/mumbles/dotfiles/docker/SERVICE/`:

```bash
# Example: traefik/.env.template
DOMAIN=op://Docker-Stack/Traefik-Domain/password
ACME_EMAIL=op://Docker-Stack/Traefik-Acme-Email/password
TRAEFIK_AUTH=op://Docker-Stack/Traefik-Auth/password
```

### 2. 1Password Vault Structure
All secrets are stored in the `Docker-Stack` vault with descriptive names:

- `Authentik-Database-Password`
- `Authentik-Secret-Key`
- `Authentik-Redis-Password`
- `Immich-Database-Password`
- `Immich-JWT-Secret`
- `Monitoring-Grafana-Password`
- `Nextcloud-MySQL-Root-Password`
- `Nextcloud-MySQL-Password`
- `Nextcloud-Redis-Password`
- `Nextcloud-Admin-Password`
- `Shared-Redis-Password`
- `Traefik-Domain`
- `Traefik-Acme-Email`
- `Traefik-Auth`

### 3. Sync Process
When you run `./scripts/secrets sync --force`:

1. **Backup**: Current `.env.local` files are backed up
2. **Inject**: 1Password CLI replaces template references with actual secrets
3. **Generate**: New `.env.local` files are created with real values

## 🔒 Security Benefits

- **No plaintext secrets** in version control
- **Centralized secret management** in 1Password
- **Audit trail** of all secret access
- **Team collaboration** via shared vaults
- **Automatic backup** and rotation support

## 🔄 Workflow Examples

### Daily Development
```bash
# Start of day - sync latest secrets
./scripts/secrets sync --force

# Work with your services...
docker compose up -d

# Check if everything is current
./scripts/secrets status
```

### Adding New Secrets
```bash
# Add secret to 1Password vault manually or via CLI
op item create --vault="Docker-Stack" --category="Password" \
  --title="New-Secret-Name" password="secret-value"

# Update template file to reference new secret
# SERVICE/.env.template: NEW_VAR=op://Docker-Stack/New-Secret-Name/password

# Sync to generate updated .env.local
./scripts/secrets sync --service SERVICE --force
```

### Secret Rotation
```bash
# Update secret in 1Password
op item edit "Secret-Name" --vault="Docker-Stack" password="new-value"

# Sync affected services
./scripts/secrets sync --force

# Restart affected containers
docker compose restart
```

## 🛠️ Troubleshooting

### Authentication Issues
```bash
# Check 1Password CLI auth
op account list

# Sign in if needed
eval $(op signin)
```

### Template Errors
```bash
# Test template manually
op inject -i /path/to/.env.template -o /tmp/test.env

# Check vault contents
op vault list
op item list --vault="Docker-Stack"
```

### Backup Recovery
```bash
# List backups
ls -la /home/mumbles/dotfiles/docker/*/.*backup*

# Restore from backup
cp service/.env.local.backup.TIMESTAMP service/.env.local
```

## 📖 Advanced Usage

### Custom Vault Operations
```bash
# Create new vault
op vault create "New-Vault-Name"

# Move secrets between vaults
op item move "item-name" --current-vault="Docker-Stack" --destination-vault="New-Vault"

# Share vault with team members
op vault user grant --vault="Docker-Stack" --user="team@example.com"
```

### Automation Integration
```bash
# Pre-commit hook example
#!/bin/bash
if ! ./scripts/secrets status >/dev/null; then
  echo "❌ Secrets not synced. Run: ./scripts/secrets sync --force"
  exit 1
fi
```

---

*This integration provides secure, scalable secret management for your entire Docker infrastructure.*
