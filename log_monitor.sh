#!/bin/bash
# log_monitor.sh - Monitors system logs for suspicious errors

LOG_FILE="/var/log/system_maintenance.log"
SYS_LOG="/var/log/syslog"
ALERT_KEYWORDS=("error" "failed" "unauthorized" "critical")

log_and_exit() {
    echo "[$(date)] ERROR: $1" | tee -a "$LOG_FILE"
    exit 1
}

echo "[$(date)] Starting log monitoring..." | tee -a "$LOG_FILE"

if [[ ! -f "$SYS_LOG" ]]; then
    log_and_exit "System log file not found."
fi

for keyword in "${ALERT_KEYWORDS[@]}"; do
    MATCHES=$(grep -i "$keyword" "$SYS_LOG" | tail -n 5)

    if [[ ! -z "$MATCHES" ]]; then
        echo "[$(date)] ALERT: '$keyword' found in logs." | tee -a "$LOG_FILE"
        echo "$MATCHES" | tee -a "$LOG_FILE"
    fi
done

echo "[$(date)] Log monitoring completed." | tee -a "$LOG_FILE"
