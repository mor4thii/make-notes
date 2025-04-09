#!/bin/bash

TASK="$*"
DATE=$(date +"%Y-%m-%d")
FILE="todo.md"

# Initialize todo.md if it doesn't exist
if [ ! -f "$FILE" ]; then
    touch "$FILE"
fi

# Count existing tasks to determine the next number
TASK_COUNT=$(grep -c "^- " "$FILE")
NEW_TASK_NUMBER=$((TASK_COUNT + 1))

# Add new task with the auto-numbering format
echo "- [ ] $DATE: $TASK" >> "$FILE"
echo "Added task #$NEW_TASK_NUMBER: $TASK"