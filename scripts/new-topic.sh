#!/usr/bin/env bash

source scripts/shared.sh

SLUG=$(shuf -n 2 /usr/share/dict/words | tr '\n' '-' | sed 's/-$//')

TOPIC="${1:-uncategorized}"
TITLE="${2:-$SLUG}"
build_topic_file_by_title FILE "$TOPIC" "$TITLE"

TEMPLATE="templates/topic.md"

if [ ! -f "$FILE" ]; then
    sed "s/{{TOPIC}}/$TITLE/g" "$TEMPLATE" > "$FILE"
    echo "Created topic: $FILE"
else
    echo "Topic already exists: $FILE"
fi
