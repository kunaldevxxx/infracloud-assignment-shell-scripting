#!/bin/bash
check_file_size() {
    local file_path=$1
    local size_threshold=$2

    file_size=$(du -k "$file_path" | cut -f1)
    if [ "$file_size" -gt "$size_threshold" ]; then
        echo "File size: ${file_size} KB. Warning: Exceeds threshold of ${size_threshold} KB!"
    else
        echo "File size: ${file_size} KB. Within the threshold of ${size_threshold} KB."
    fi
}

read -p "Enter the file path: " file_path
read -p "Enter the size threshold (in KB): " size_threshold

if [ ! -f "$file_path" ]; then
    echo "File does not exist."
    exit 1
fi

check_file_size "$file_path" "$size_threshold"