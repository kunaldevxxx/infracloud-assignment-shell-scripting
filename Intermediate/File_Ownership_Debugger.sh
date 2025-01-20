#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <username>"
    exit 1
fi

directory_path=$1
username=$2
if [ ! -d "$directory_path" ]; then
    echo "Error: Directory $directory_path does not exist."
    exit 1
fi
find "$directory_path" -type f | while read -r file; do
    file_owner=$(ls -l "$file" | awk '{print $3}')
    if [ "$file_owner" != "$username" ]; then
        echo "File not owned by $username: $file"
    fi
done