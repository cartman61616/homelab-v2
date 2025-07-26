# Traefik Reverse Proxy

This directory contains the Traefik reverse proxy configuration for routing all your Docker services through a single entry point with automatic SSL/TLS certificates.

## Features

- **Automatic HTTPS**: Let's Encrypt integration with HTTP to HTTPS redirect
- **Service Discovery**: Automatic discovery of Docker services with labels
- **Dashboard**: Web UI for monitoring routes and services
- **Security**: Built-in authentication, rate limiting, and security headers
- **Load Balancing**: Built-in load balancing capabilities

## Setup Instructions

1. **Configure your domain** (optional, defaults to localhost):
   ```bash
   # Edit ~/dotfiles/docker/traefik/.env
   DOMAIN=yourdomain.com
   ACME_EMAIL=admin@yourdomain.com
   ```

2. **Start Traefik:**
   ```bash
   docker compose up -d
   ```

3. **Update other services** to use Traefik network:
   ```bash
   # Restart your monitoring and authentik services
   cd ../monitoring && docker compose up -d
   cd ../authentik && docker compose up -d
   ```

## Access URLs

When using localhost (default):
- **Traefik Dashboard**: https://traefik.localhost (admin/password)
- **Grafana**: https://grafana.localhost
- **Prometheus**: https://prometheus.localhost (requires auth)
- **Authentik**: https://auth.localhost
- **Alertmanager**: https://alertmanager.localhost (requires auth)
- **cAdvisor**: https://cadvisor.localhost (requires auth)
- **Node Exporter**: https://node-exporter.localhost (requires auth)

## Authentication

### Traefik Dashboard
- **Username**: admin
- **Password**: password (change in .env file!)

### Basic Auth Services
Services like Prometheus, Alertmanager, etc. use the same authentication as the Traefik dashboard.

## Configuration

### Environment Variables (.env)
- `DOMAIN`: Base domain for all services
- `ACME_EMAIL`: Email for Let's Encrypt certificates
- `TRAEFIK_AUTH`: Basic auth credentials (htpasswd format)
- `LOG_LEVEL`: Traefik logging level

### Adding New Services

To add Traefik routing to a new service, add these labels to your docker-compose.yml:

```yaml
services:
  myservice:
    image: myimage
    networks:
      - traefik
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.myservice.rule=Host(`myservice.${DOMAIN:-localhost}`)"
      - "traefik.http.routers.myservice.entrypoints=websecure"
      - "traefik.http.routers.myservice.tls.certresolver=letsencrypt"
      - "traefik.http.services.myservice.loadbalancer.server.port=80"

networks:
  traefik:
    external: true
```

### Security Middlewares

Available middlewares defined in `config/dynamic.yml`:
- `secure-headers`: Security headers (HSTS, frame options, etc.)
- `rate-limit`: Rate limiting (50 req/s average, 100 burst)
- `auth`: Basic authentication

Example usage:
```yaml
labels:
  - "traefik.http.routers.myservice.middlewares=auth,secure-headers,rate-limit"
```

## Network Architecture

```
Internet → Traefik (80/443) → Services
                ↓
        Traefik Dashboard (8080)
```

- **External Network**: `traefik` - Used for service discovery
- **Internal Networks**: Each service keeps its own internal network
- Traefik connects to both networks to route external traffic to internal services

## SSL/TLS Certificates

- **Development**: Self-signed certificates for localhost
- **Production**: Automatic Let's Encrypt certificates
- **Storage**: Certificates stored in `./letsencrypt/acme.json`

### For Production Domains

1. Point your domain's DNS to your server
2. Update the `DOMAIN` and `ACME_EMAIL` in `.env`
3. Restart Traefik: `docker compose restart traefik`

## Troubleshooting

### Check Traefik Status
```bash
docker compose ps
docker compose logs traefik
```

### View Routes
Visit the Traefik dashboard at https://traefik.[yourdomain] to see all active routes and services.

### Certificate Issues
```bash
# Check certificate status
docker compose exec traefik cat /letsencrypt/acme.json

# Reset certificates (careful!)
rm letsencrypt/acme.json
touch letsencrypt/acme.json
chmod 600 letsencrypt/acme.json
docker compose restart traefik
```

### Service Not Accessible
1. Ensure service is on the `traefik` network
2. Check service labels are correct
3. Verify service is actually running
4. Check Traefik logs for errors

## Security Notes

- Change default passwords before production use
- Consider IP whitelisting for admin services
- Review and customize security headers
- Monitor access logs for suspicious activity
- Keep Traefik updated regularly

## Directory Structure

```
traefik/
├── docker-compose.yml
├── .env -> ~/dotfiles/docker/traefik/.env
├── config/
│   └── dynamic.yml          # Dynamic configuration
├── letsencrypt/
│   └── acme.json           # SSL certificates
├── logs/                   # Access logs
└── README.md
```


## 🌐 DNS Setup
For Cloudflare DNS configuration instructions, see the setup file located outside this repository for security reasons:
`../cloudflare_setup.txt`

This file contains your specific server details and should not be committed to version control.
