#!/usr/bin/env bash

get_today_and_file() {
    declare -n TODAY=$1
    declare -n FILE=$2

    get_data_folder DATA_FOLDER

    YEAR="$(date +"%Y")"
    MONTH="$(date +"%m-%B")"
    FOLDER="${DATA_FOLDER/:-}${YEAR}/${MONTH}"
    mkdir -p "${FOLDER}"

    TODAY="$(date +"%Y-%m-%d")"
    FILE="${FOLDER}/${TODAY}.md"
}

get_data_folder() {
    declare -n DATA_FOLDER=$1

    DATA_FOLDER=""
    if [[ -f config/data-folder ]]; then
        IFS= read -r DATA_FOLDER < config/data-folder
        [[ "${DATA_FOLDER}" != */ ]] && DATA_FOLDER="${DATA_FOLDER}/"
    fi
}
