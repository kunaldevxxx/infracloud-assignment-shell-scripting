#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <search_string> <directory_path>"
    exit 1
fi

search_string=$1
directory_path=$2

if [ ! -d "$directory_path" ]; then
    echo "Error: Directory $directory_path does not exist."
    exit 1
fi

grep -rnw "$directory_path" -e "$search_string" --include \*.log

if [ $? -ne 0 ]; then
    echo "No matches found for '$search_string' in $directory_path"
fi