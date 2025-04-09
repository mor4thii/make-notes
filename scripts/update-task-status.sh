#!/bin/bash

LINE_NUMBER=$1
STATUS=$2
FILE="todo.md"

if [ -z "$LINE_NUMBER" ] || [ -z "$STATUS" ]; then
    echo "Usage: $0 <line_number> <status>"
    echo "Status must be: todo, progress, done"
    exit 1
fi

case $STATUS in
    todo)     SYMBOL="[ ]" ;;
    progress) SYMBOL="[~]" ;;
    done)     SYMBOL="[x]" ;;
    *)        echo "Invalid status: $STATUS"; exit 1 ;;
esac

# Use sed to update the checkbox
sed -i.bak "${{LINE_NUMBER}}s/^\- \[[ x~]\]/- ${SYMBOL}/" "$FILE"
echo "Updated line $LINE_NUMBER to status: $STATUS"