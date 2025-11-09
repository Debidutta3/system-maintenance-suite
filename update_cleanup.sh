#!/bin/bash
# update_cleanup.sh - System update and cleanup script

LOG_FILE="/var/log/system_maintenance.log"

log_and_exit() {
    echo "[$(date)] ERROR: $1" | tee -a "$LOG_FILE"
    exit 1
}

echo "===============================" | tee -a "$LOG_FILE"
echo "[$(date)] Starting system update and cleanup..." | tee -a "$LOG_FILE"

if sudo apt update -y >>"$LOG_FILE" 2>&1 && sudo apt upgrade -y >>"$LOG_FILE" 2>&1; then
    echo "[$(date)] System packages updated successfully." | tee -a "$LOG_FILE"
else
    log_and_exit "System update failed."
fi

if sudo apt autoremove -y >>"$LOG_FILE" 2>&1 && sudo apt autoclean -y >>"$LOG_FILE" 2>&1; then
    echo "[$(date)] Cleanup completed successfully." | tee -a "$LOG_FILE"
else
    log_and_exit "System cleanup failed."
fi

echo "[$(date)] System update and cleanup finished." | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"
