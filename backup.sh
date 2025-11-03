BACKUP_SRC="/home /etc"
BACKUP_DEST="/var/backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DEST/system_backup_$DATE.tar.gz"
LOG_FILE="/var/log/system_backup.log"

# Create destination folder if not exists
mkdir -p "$BACKUP_DEST"

echo "[$(date)] Starting backup..." | tee -a "$LOG_FILE"

# Perform backup
if tar -czf "$BACKUP_FILE" $BACKUP_SRC 2>>"$LOG_FILE"; then
    echo "[$(date)] Backup completed successfully: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    echo "[$(date)] Backup failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# Optional: Delete old backups (older than 7 days)
find "$BACKUP_DEST" -type f -name "*.tar.gz" -mtime +7 -delete
echo "[$(date)] Old backups cleaned." | tee -a "$LOG_FILE"
