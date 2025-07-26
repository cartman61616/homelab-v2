# Docker Stack Monitoring

This directory contains a comprehensive monitoring solution for your Docker stack using Prometheus, Grafana, and supporting tools.

## Components

- **Prometheus**: Metrics collection and storage
- **Grafana**: Visualization and dashboards
- **Node Exporter**: Host metrics collection
- **cAdvisor**: Container metrics collection
- **Alertmanager**: Alert management
- **Loki**: Log aggregation
- **Promtail**: Log collection

## Setup Instructions

1. **Start the monitoring stack:**
   ```bash
   docker compose up -d
   ```

2. **Access the services:**
   - **Grafana**: http://localhost:3000 (admin/your_secure_password)
   - **Prometheus**: http://localhost:9090
   - **Alertmanager**: http://localhost:9093
   - **cAdvisor**: http://localhost:8081
   - **Node Exporter**: http://localhost:9100/metrics

## Default Credentials

- **Grafana**: admin / your_secure_password

## Configuration

The `.env` file is symlinked from `~/dotfiles/docker/monitoring/.env` for centralized configuration management.

## Metrics Being Collected

### Host Metrics (Node Exporter)
- CPU usage, memory, disk, network
- System load, uptime
- Filesystem metrics

### Container Metrics (cAdvisor)
- Container CPU and memory usage
- Network I/O, block I/O
- Container lifecycle events

### Application Metrics
- **Authentik**: Available at port 9300
- **Custom applications**: Add to prometheus.yml

## Dashboards

Grafana comes pre-configured with Prometheus and Loki data sources. You can:

1. Import community dashboards from grafana.com
2. Create custom dashboards
3. Set up alerts based on metrics

### Recommended Dashboard IDs to Import:
- **Node Exporter Full**: 1860
- **Docker Container & Host Metrics**: 10619
- **Prometheus Stats**: 2
- **cAdvisor exporter**: 14282

## Alerts

Default alert rules are configured for:
- Container/service downtime
- High CPU usage (>80%)
- High memory usage (>85%)
- High disk usage (>85%)
- Container memory limits (>90%)

## Log Management

### Loki + Promtail
- **Loki**: Log aggregation backend
- **Promtail**: Collects logs from containers and system

Logs are automatically collected from:
- All Docker containers
- System logs (/var/log/syslog)

## Customization

### Adding New Targets

Edit `prometheus/prometheus.yml` to add new scrape targets:

```yaml
- job_name: 'my-app'
  static_configs:
    - targets: ['my-app:8080']
```

### Custom Alerts

Add new alert rules to `prometheus/alerts.yml`:

```yaml
- alert: MyCustomAlert
  expr: my_metric > 100
  for: 5m
  labels:
    severity: warning
  annotations:
    summary: "Custom alert triggered"
```

### Email Notifications

Edit `alertmanager/alertmanager.yml` to configure email alerts:

```yaml
receivers:
  - name: 'email'
    email_configs:
      - to: 'admin@example.com'
        subject: 'Alert: {{ .GroupLabels.alertname }}'
```

## Directory Structure

```
monitoring/
├── docker-compose.yml
├── .env -> ~/dotfiles/docker/monitoring/.env
├── prometheus/
│   ├── prometheus.yml      # Main Prometheus config
│   └── alerts.yml          # Alert rules
├── grafana/
│   └── provisioning/       # Auto-provisioned datasources & dashboards
├── alertmanager/
│   └── alertmanager.yml    # Alert routing config
├── loki/
│   └── loki.yml           # Log aggregation config
├── promtail/
│   └── promtail.yml       # Log collection config
└── README.md
```

## Maintenance

### Backup
Important directories to backup:
- Grafana data: Docker volume `monitoring_grafana_data`
- Prometheus data: Docker volume `monitoring_prometheus_data`
- Configuration files in this directory

### Updates
```bash
docker compose pull
docker compose up -d
```

### Troubleshooting

1. **Check container status:**
   ```bash
   docker compose ps
   ```

2. **View logs:**
   ```bash
   docker compose logs [service-name]
   ```

3. **Restart services:**
   ```bash
   docker compose restart [service-name]
   ```

## Security Notes

- Change default Grafana password in production
- Consider setting up reverse proxy with SSL
- Restrict access to monitoring ports
- Review alert notification channels
