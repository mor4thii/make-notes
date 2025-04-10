#!/usr/bin/env bash

source scripts/shared.sh

get_today_and_file TODAY FILE
TEMPLATE="templates/daily-note.md"

if [ ! -f "$FILE" ]; then
    sed "s/{{DATE}}/${TODAY}/g" "$TEMPLATE" > "$FILE"
    echo "Created note: $FILE"
else
    echo "Note already exists: $FILE"
fi
