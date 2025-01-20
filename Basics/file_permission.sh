#!/bin/bash

get_permissions() {
    local file_path=$1

    if [ ! -e "$file_path" ]; then
        echo "File does not exist."
        exit 1
    fi

    permissions=$(stat -c "%A" "$file_path")

    owner_perms=${permissions:1:3}
    group_perms=${permissions:4:3}
    others_perms=${permissions:7:3}

    echo "Owner: $(parse_permissions $owner_perms)"
    echo "Group: $(parse_permissions $group_perms)"
    echo "Others: $(parse_permissions $others_perms)"
}

parse_permissions() {
    local perms=$1
    local result=""

    [[ ${perms:0:1} == "r" ]] && result+="Read-Yes, " || result+="Read-No, "
    [[ ${perms:1:1} == "w" ]] && result+="Write-Yes, " || result+="Write-No, "
    [[ ${perms:2:1} == "x" ]] && result+="Execute-Yes" || result+="Execute-No"

    echo $result
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path=$1
get_permissions "$file_path"