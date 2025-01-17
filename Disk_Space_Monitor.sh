#!/bin/bash
THRESHOLD=80

LOG_FILE="./disk_space_monitor.log"  

df -h | awk 'NR>1 {print $5 " " $1}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')
    partition=$(echo $output | awk '{print $2}')
    
    if [[ $usage =~ ^[0-9]+$ ]] && [ $usage -ge $THRESHOLD ]; then 
        echo "Warning: Partition $partition is at ${usage}% usage" | tee -a $LOG_FILE
    fi
done