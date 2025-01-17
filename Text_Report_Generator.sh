#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file=$1

if [ ! -f "$log_file" ]; then
    echo "Log file not found!"
    exit 1
fi

grep -i "error" "$log_file" | awk '{error[$0]++} END {for (msg in error) print msg ": " error[msg] " occurrences"}' > error_summary.txt

echo "Error summary has been written to error_summary.txt"