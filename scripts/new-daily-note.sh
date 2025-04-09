#!/bin/bash

TODAY=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m-%B")
FILE="${{YEAR}}/${{MONTH}}/${{TODAY}}.md"
TEMPLATE="templates/daily-note.md"

mkdir -p "${{YEAR}}/${{MONTH}}"

if [ ! -f "$FILE" ]; then
    sed "s/{{DATE}}/${{TODAY}}/g" "$TEMPLATE" > "$FILE"
    echo "Created note: $FILE"
else
    echo "Note already exists: $FILE"
fi