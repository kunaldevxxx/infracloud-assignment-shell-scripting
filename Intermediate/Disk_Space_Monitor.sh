#!/bin/bash

THRESHOLD=80
LOG_FILE="/home/kunal-khare/Assignments/infracloud-assignment-shell-scripting/Intermediate/disk_space_monitor.log"

if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
    echo "Log file created at: $LOG_FILE" >> "$LOG_FILE"
fi

monitor_disk_space() {
    if ! command -v df &> /dev/null; then
        echo "Error: df command not found." | tee -a "$LOG_FILE"
        exit 1
    fi
    df -h --output=pcent,target | tail -n +2 | while read -r output; do
        usage=$(echo "$output" | awk '{print $1}' | sed 's/%//')
        partition=$(echo "$output" | awk '{print $2}')
        echo "Checking partition: $partition, usage: $usage%" | tee -a "$LOG_FILE"

        if [[ $usage =~ ^[0-9]+$ ]] && [ "$usage" -ge "$THRESHOLD" ]; then 
            message="Warning: Partition $partition is at ${usage}% usage"
            echo "$message" | tee -a "$LOG_FILE"
        fi
    done
}

monitor_disk_space