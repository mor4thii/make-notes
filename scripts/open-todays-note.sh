#!/usr/bin/env bash

source scripts/shared.sh

get_today_and_file TODAY FILE
EDITOR="${EDITOR:-vim}" # Default to vim if EDITOR isn't set

if [ -f "$FILE" ]; then
    $EDITOR "$FILE"
else
    echo "Today's note doesn't exist. Run: make new-note"
fi
