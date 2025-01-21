#!/bin/bash

DIRECTORY="/mnt/e/infracloud-assignment-shell-scripting"

check_port_usage() {
    local PORT=$1
    local KILL_PROCESS=$2

    if netstat -tuln | grep -q ":$PORT "; then
        echo "Port $PORT is in use."
        
        PID=$(lsof -i :$PORT -t)
        if [ -n "$PID" ]; then
            echo "Process ID using port $PORT: $PID"

            if [ "$KILL_PROCESS" == "yes" ]; then
                kill -9 $PID
                if [ $? -eq 0 ]; then
                    echo "Process $PID has been terminated."
                else
                    echo "Failed to terminate process $PID."
                fi
            fi
        else
            echo "Could not find the process ID using port $PORT."
        fi
    else
        echo "Port $PORT is not in use."
    fi
}

read -p "Enter the port number to check: " PORT
KILL_PROCESS="yes"
check_port_usage $PORT $KILL_PROCESS