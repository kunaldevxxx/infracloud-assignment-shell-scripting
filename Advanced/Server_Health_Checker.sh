#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80

SERVICES=("cron" "ssh")

LOG_FILE="$HOME/server_health.log"

check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $CPU_USAGE%"
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "CPU usage is above threshold!" | tee -a $LOG_FILE
    fi
}

check_memory() {i
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $MEM_USAGE%"
    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        echo "Memory usage is above threshold!" | tee -a $LOG_FILE
    fi
}

check_services() {
    for SERVICE in "${SERVICES[@]}"; do
        if systemctl is-active --quiet $SERVICE; then
            echo "$SERVICE is running"
        else
            echo "$SERVICE is not running!" | tee -a $LOG_FILE
        fi
    done
}

main() {
    echo "Starting server health check..."
    check_cpu
    check_memory
    check_services
    echo "Server health check completed."
}

main