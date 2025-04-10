#!/usr/bin/env bash

# I cannot use declare -n as I have an ancient bash 3.2 on Mac OSX :/
# I do not want POSIX compatibility to think about and I do not want to use zsh on one system and bash on the other.
# So old school it is

get_today_and_file() {
    local today_var=$1
    local file_var=$2

    get_data_folder DATA_FOLDER
    local year month folder today file

    year="$(date +"%Y")"
    month="$(date +"%m-%B")"
    folder="${DATA_FOLDER:-}${year}/${month}"
    mkdir -p "$folder"

    today="$(date +"%Y-%m-%d")"
    file="${folder}/${today}.md"

    eval "$today_var=\"\$today\""
    eval "$file_var=\"\$file\""
}

get_data_folder() {
    local varname=$1
    local folder=""

    if [[ -f config/data-folder ]]; then
        IFS= read -r folder < config/data-folder
        [[ "$folder" != */ ]] && folder="${folder}/"
    fi

    eval "$varname=\"\$folder\""
}
