#!/bin/bash
# maintenance_suite.sh - Menu-driven System Maintenance Suite

LOG_FILE="/var/log/system_maintenance.log"

log_and_exit() {
    echo "[$(date)] ERROR: $1" | tee -a "$LOG_FILE"
    exit 1
}

BACKUP_SCRIPT="./backup.sh"
UPDATE_SCRIPT="./update_cleanup.sh"
LOG_MONITOR_SCRIPT="./log_monitor.sh"

show_menu() {
    clear
    echo "=============================================="
    echo "          SYSTEM MAINTENANCE SUITE"
    echo "=============================================="
    echo "1. Run System Backup"
    echo "2. Run System Update and Cleanup"
    echo "3. Run Log Monitoring"
    echo "4. Exit"
    echo "----------------------------------------------"
    read -p "Enter your choice [1-4]: " choice
}

run_choice() {
    case $choice in
        1) bash "$BACKUP_SCRIPT" || log_and_exit "Backup script failed." ;;
        2) bash "$UPDATE_SCRIPT" || log_and_exit "Update script failed." ;;
        3) bash "$LOG_MONITOR_SCRIPT" || log_and_exit "Log monitoring failed." ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Try again."; sleep 1 ;;
    esac
}

while true; do
    show_menu
    run_choice
    read -p "Press Enter to continue..."
done
