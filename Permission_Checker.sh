#!/bin/bash

DIRECTORY="/mnt/e/infracloud-assignment-shell-scripting"

find "$DIRECTORY" -type f -name "*.txt" -exec chmod 644 {} \;

echo "Permissions for .txt files have been set to 644."