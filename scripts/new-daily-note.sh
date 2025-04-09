#!/usr/bin/env bash

TODAY=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m-%B")
TEMPLATE="templates/daily-note.md"

DATA_FOLDER=
if [ -f config/data-folder ]; then
    IFS= read -r DATA_FOLDER < config/data-folder
    [[ "${DATA_FOLDER}" != */ ]] && DATA_FOLDER="${DATA_FOLDER}/"
fi

FOLDER="${DATA_FOLDER/:-}${YEAR}/${MONTH}"
mkdir -p "${FOLDER}"

FILE="${FOLDER}/${TODAY}.md"
if [ ! -f "$FILE" ]; then
    sed "s/{{DATE}}/${TODAY}/g" "$TEMPLATE" > "$FILE"
    echo "Created note: $FILE"
else
    echo "Note already exists: $FILE"
fi
