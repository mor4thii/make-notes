#!/bin/bash

LINE_NUMBER=$1
shift
NEW_TEXT="$*"
FILE="todo.md"

if [ -z "$LINE_NUMBER" ] || [ -z "$NEW_TEXT" ]; then
    echo "Usage: $0 <line_number> <new task description>"
    exit 1
fi

# Extract current date and status
LINE=$(sed -n "${{LINE_NUMBER}}p" "$FILE")
STATUS=$(echo "$LINE" | grep -o "\[[ x~]\]")
DATE=$(echo "$LINE" | grep -oP "\d{4}-\d{2}-\d{2}")

# Replace line with updated description
NEW_LINE="- $STATUS $DATE: $NEW_TEXT"
sed -i.bak "${{LINE_NUMBER}}s/.*/$NEW_LINE/" "$FILE"
echo "Updated line $LINE_NUMBER with new text."