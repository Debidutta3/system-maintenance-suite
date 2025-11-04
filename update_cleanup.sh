LOG_FILE="/var/log/system_update_cleanup.log"

echo "===============================" | tee -a "$LOG_FILE"
echo "[$(date)] Starting system update and cleanup..." | tee -a "$LOG_FILE"

# Update and upgrade system packages
if sudo apt update -y >>"$LOG_FILE" 2>&1 && sudo apt upgrade -y >>"$LOG_FILE" 2>&1; then
    echo "[$(date)] System packages updated successfully." | tee -a "$LOG_FILE"
else
    echo "[$(date)] Package update failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# Remove unnecessary packages
if sudo apt autoremove -y >>"$LOG_FILE" 2>&1 && sudo apt autoclean -y >>"$LOG_FILE" 2>&1; then
    echo "[$(date)] Cleanup completed successfully." | tee -a "$LOG_FILE"
else
    echo "[$(date)] Cleanup failed!" | tee -a "$LOG_FILE"
    exit 1
fi

echo "[$(date)] System update and cleanup finished." | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"
