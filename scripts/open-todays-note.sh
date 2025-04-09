#!/usr/bin/env bash

EDITOR="${EDITOR:-vim}" # Default to vim if EDITOR isn't set
TODAY=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m-%B")
FILE="${YEAR}/${MONTH}/${TODAY}.md"

if [ -f "$FILE" ]; then
    $EDITOR "$FILE"
else
    echo "Today's note doesn't exist. Run: make new-note"
fi
