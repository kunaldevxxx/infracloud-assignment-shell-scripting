#!/bin/bash

remove_duplicate_lines() {
    local input_file=$1
    local output_file=$2

    if [ ! -e "$input_file" ]; then
        echo "Input file does not exist."
        exit 1
    fi

    if [ ! -s "$input_file" ]; then
        echo "Input file is empty."
        exit 1
    fi

    sort "$input_file" | uniq > "$output_file"
    echo "Duplicate lines removed. Output saved to $output_file."
}

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file=$1
output_file=$2
remove_duplicate_lines "$input_file" "$output_file"