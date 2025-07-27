# 📸 Immich Photo Management

Self-hosted photo and video management solution with machine learning-powered features, smart search, and automatic backup capabilities.

## 🏗️ Architecture

Immich uses **shared database services** for optimal resource utilization:

```
┌─────────────────────┐    ┌─────────────────┐
│      Immich         │    │ Shared Services │
├─────────────────────┤    ├─────────────────┤
│ • Server            │───►│ • PostgreSQL    │  
│ • Microservices     │───►│ • Redis (DB 0)  │
│ • Machine Learning  │    │                 │
└─────────────────────┘    └─────────────────┘
```

## 📦 Components

- **immich-server:** Main API server and web interface
- **immich-microservices:** Background processing (thumbnails, metadata, etc.)
- **immich-machine-learning:** AI features (face recognition, object detection)
- **Database:** Shared PostgreSQL (`shared_postgres`, database: `immich`)
- **Cache:** Shared Redis (`shared_redis`, database: 0)
- **Storage:** Local directory for photos/videos (`./library`)

## 🚀 Setup Instructions

### Prerequisites
1. **Shared services must be running first:**
   ```bash
   cd ../shared-services
   ./manage.sh start
   ./manage.sh status  # Verify services are healthy
   ```

2. **Storage preparation:**
   ```bash
   # Ensure library directory exists and has proper permissions
   mkdir -p ./library
   chmod 755 ./library
   ```

3. **Domain configuration:**
   - Ensure `photos.snorlax.me` points to your server
   - Traefik handles SSL certificates automatically

### Installation

1. **Start Immich:**
   ```bash
   docker compose up -d
   ```

2. **Monitor startup:**
   ```bash
   docker compose logs -f
   ```

3. **Access the web interface:**
   - URL: `https://photos.snorlax.me`
   - Create your admin account on first visit

## 🔧 Configuration

### Environment Variables
Key settings in `.env`:
```bash
# Domain
DOMAIN=snorlax.me

# Storage location
UPLOAD_LOCATION=/home/mumbles/docker-stack/immich/library

# Shared database configuration (automatically configured)
DB_HOSTNAME=shared_postgres
DB_USERNAME=postgres
DB_DATABASE_NAME=immich
DB_PASSWORD=secure_shared_password

# Shared Redis configuration (automatically configured)
REDIS_HOSTNAME=shared_redis
REDIS_PASSWORD=secure_shared_password

# Machine Learning
IMMICH_MACHINE_LEARNING_URL=http://immich-machine-learning:3003

# Security
JWT_SECRET=randomly_generated_secret
```

### Database Migration Status
✅ **Migration Complete:**
- **Old:** `immich_postgres` (dedicated container)
- **New:** `shared_postgres` (shared container, database: `immich`)
- **Old:** `immich_redis` (dedicated container)  
- **New:** `shared_redis` (shared container, database: 0)
- **Benefits:** ~200MB RAM savings + simplified management

## 🔗 Integration Features

### Mobile Apps
- **iOS:** Available on App Store
- **Android:** Available on Google Play
- **Auto-backup:** Configurable photo/video sync

### API Access
- **REST API:** Full-featured API for integrations
- **Documentation:** Available at `https://photos.snorlax.me/api-docs`

### Traefik Integration
Automatically configured with Traefik:
- **URL:** `photos.snorlax.me`
- **SSL:** Automatic Let's Encrypt certificates
- **Port:** 2283 (internal)

## 📊 Monitoring

### Health Checks
```bash
# Check all Immich containers
docker compose ps

# View logs by service
docker compose logs -f immich-server
docker compose logs -f immich-microservices
docker compose logs -f immich-machine-learning

# Check database connectivity
cd ../shared-services
./manage.sh psql -c "\c immich; SELECT version();"
```

### Storage Monitoring
```bash
# Check library storage usage
du -sh ./library

# Monitor container resources
docker stats immich_server immich_microservices immich_machine_learning

# Check shared database usage
cd ../shared-services && ./manage.sh status
```

## 🤖 Machine Learning Features

### Available Features
- **Face Recognition:** Automatic person detection and grouping
- **Object Detection:** Smart search by objects in photos
- **Duplicate Detection:** Find and manage duplicate photos
- **Reverse Geocoding:** Location information from GPS data

### Hardware Acceleration (Optional)
To enable GPU acceleration, uncomment the hardware acceleration section in `docker-compose.yml`:
```yaml
# For NVIDIA GPUs
extends:
  file: hwaccel.transcoding.yml
  service: nvenc

# For Intel Quick Sync
extends:
  file: hwaccel.transcoding.yml
  service: quicksync
```

## 🔒 Security

### Database Security
- Uses shared PostgreSQL with dedicated `immich` database
- Strong randomly generated passwords
- Network isolation through Docker networks

### Photo Privacy
- Self-hosted: Your photos never leave your server
- User management: Control who can access your photos
- HTTPS only: All traffic encrypted via Traefik

### Backup Security
- Local storage: Photos stored in `./library`
- Database backup: Included in shared services backup

## 📱 Mobile App Setup

1. **Download the Immich mobile app**
2. **Server configuration:**
   - Server URL: `https://photos.snorlax.me`
   - Login with your web account credentials
3. **Enable auto-backup** in app settings
4. **Configure backup albums** (Camera, Screenshots, etc.)

## 🚨 Troubleshooting

### Common Issues

1. **Service won't start:**
   ```bash
   # Check if shared services are running
   cd ../shared-services && ./manage.sh status
   
   # Verify database connection
   docker exec immich_server wget -q --spider http://shared_postgres:5432 && echo "PostgreSQL reachable"
   ```

2. **Upload/storage errors:**
   ```bash
   # Check library permissions
   ls -la ./library
   
   # Check disk space
   df -h ./library
   
   # Verify upload location in config
   docker exec immich_server env | grep UPLOAD_LOCATION
   ```

3. **Machine learning not working:**
   ```bash
   # Check ML container logs
   docker compose logs immich-machine-learning
   
   # Verify ML service connectivity
   docker exec immich_server curl -f http://immich-machine-learning:3003/ping
   ```

### Debug Commands
```bash
# Check all containers
docker compose ps -a

# Full logs
docker compose logs

# Check database tables
cd ../shared-services && ./manage.sh psql -c "\c immich; \dt"

# Test Redis connection
docker exec shared_redis redis-cli -a "password" -n 0 ping
```

## 🔄 Backup & Recovery

### Database Backup
Immich data is automatically included in shared services backups:
```bash
cd ../shared-services
./manage.sh backup
```

### Photo/Video Backup
```bash
# Backup library (photos and videos)
tar -czf immich-library-$(date +%Y%m%d).tar.gz ./library

# Sync to external storage (example)
rsync -av ./library/ /path/to/backup/location/
```

### Full System Backup
```bash
# Complete Immich backup
tar -czf immich-full-backup-$(date +%Y%m%d).tar.gz \
  .env docker-compose.yml ./library
```

## 📈 Performance Optimization

### Database Performance
- Uses shared PostgreSQL with optimized settings
- Regular maintenance handled by shared services
- Connection pooling through shared infrastructure

### Storage Performance
- Consider SSD storage for `./library` directory
- Monitor disk I/O during heavy uploads
- Implement photo thumbnail pre-generation

### Machine Learning Performance
- CPU-only by default (works well for most use cases)
- GPU acceleration available for faster processing
- Consider increasing ML container memory for large libraries

## 🏆 Benefits of Shared Services

- **Resource Efficiency:** ~200MB RAM savings
- **Simplified Management:** Single database backup/restore process
- **Better Performance:** Optimized shared database connections
- **Easier Monitoring:** Centralized database health monitoring
- **Cost Effective:** Reduced infrastructure overhead

## 📚 Additional Resources

- **Official Documentation:** https://immich.app/docs
- **API Documentation:** Available at `/api-docs` endpoint
- **Mobile Apps:** https://immich.app/docs/install/mobile
- **Hardware Acceleration:** https://immich.app/docs/features/hardware-transcoding

---

**Next Steps:** Set up mobile apps for automatic photo backup and explore the machine learning features for smart photo organization.
