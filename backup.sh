#!/bin/bash
# backup.sh - Automated system backup script

LOG_FILE="/var/log/system_maintenance.log"

log_and_exit() {
    echo "[$(date)] ERROR: $1" | tee -a "$LOG_FILE"
    exit 1
}

# Backup configuration
BACKUP_SRC="/home /etc"
BACKUP_DEST="/var/backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DEST/system_backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DEST" || log_and_exit "Unable to create backup destination directory."

echo "[$(date)] Starting backup..." | tee -a "$LOG_FILE"

if tar -czf "$BACKUP_FILE" $BACKUP_SRC 2>>"$LOG_FILE"; then
    echo "[$(date)] Backup completed successfully: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    log_and_exit "Backup failed during compression."
fi

find "$BACKUP_DEST" -type f -name "*.tar.gz" -mtime +7 -delete
echo "[$(date)] Old backups cleaned." | tee -a "$LOG_FILE"
