#!/bin/bash
# Backup Vaultwarden
DATE=$(date +%Y%m%d)
VW_DATA="/home/erik/docker/vaultwarden/vw-data"
BACKUP_DIR="/mnt/backup/vaultwarden"
RETENTION_DAYS=14

mkdir -p "$BACKUP_DIR"

# 1. Konsistent SQLite-snapshot direkt till backup-disken
sqlite3 "$VW_DATA/db.sqlite3" ".backup '$BACKUP_DIR/db_$DATE.sqlite3'"

# 2. Allt annat — attachments, config, keys
rsync -a --exclude='db.sqlite3*' --exclude='icon_cache' --exclude='tmp' "$VW_DATA/" "$BACKUP_DIR/"

# 3. Rensa backups äldre än RETENTION_DAYS
find "$BACKUP_DIR" -name "db_*.sqlite3" -mtime +$RETENTION_DAYS -delete
