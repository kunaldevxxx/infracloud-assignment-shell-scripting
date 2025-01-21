#!/bin/bash

check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: File $1 not found!"
        exit 1
    fi
}

check_script_exists() {
    if [ ! -x "$1" ]; then
        echo "Error: Script $1 not found or not executable!"
        exit 1
    fi
}

echo "Testing file_permission.sh..."
check_script_exists "../file_permission.sh"
check_file_exists "../test_file.txt"
../file_permission.sh ../test_file.txt

echo "Testing file_size_checker.sh..."
check_script_exists "../file_size_checker.sh"
check_file_exists "../test_file.txt"
../file_size_checker.sh ../test_file.txt 100

echo "Testing count_file_and_dir.sh..."
check_script_exists "../count_file_and_dir.sh"
../count_file_and_dir.sh ..

echo "Testing duplicate_line_remover.sh..."
check_script_exists "../duplicate_line_remover.sh"
check_file_exists "../input.txt"
../duplicate_line_remover.sh ../input.txt ../output.txt

echo "Testing string_search.sh..."
check_script_exists "../string_search.sh"
../string_search.sh "test" .. 

echo "All basic tests completed."