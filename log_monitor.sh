#!/bin/bash

LOG_FILE="/var/log/log_monitor.log"
SYS_LOG="/var/log/syslog"
ALERT_KEYWORDS=("error" "failed" "unauthorized" "critical")
ALERT_EMAIL="root@localhost"

echo "[$(date)] Starting log monitoring..." | tee -a "$LOG_FILE"

check_logs() {
    for keyword in "${ALERT_KEYWORDS[@]}"; do
        MATCHES=$(grep -i "$keyword" "$SYS_LOG" | tail -n 5)
        if [[ -n "$MATCHES" ]]; then
            echo "[$(date)] ALERT: Found '$keyword' in $SYS_LOG!" | tee -a "$LOG_FILE"
            echo "$MATCHES" | tee -a "$LOG_FILE"
        fi
    done
}

check_logs

echo "[$(date)] Log monitoring completed." | tee -a "$LOG_FILE"
