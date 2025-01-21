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

echo "Testing Disk Space Monitor..."
check_script_exists "../Disk_Space_Monitor.sh"
../Disk_Space_Monitor.sh
echo "Disk Space Monitor test passed."

echo "Testing File Ownership Debugger..."
check_script_exists "../File_Ownership_Debugger.sh"
../File_Ownership_Debugger.sh /home/kunal-khare/Assignments/infracloud-assignment-shell-scripting/Intermediate/tests kunal
echo "File Ownership Debugger test passed."

echo "Testing Text Report Generator..."
check_script_exists "../Text_Report_Generator.sh"
check_file_exists "../logfile.txt"
../Text_Report_Generator.sh ../logfile.txt
echo "Text Report Generator test passed."

echo "Intermediate tests completed."