#!/usr/bin/env bash

source scripts/shared.sh

TOPIC="${1:-}"
TITLE="${2:-}"
build_topic_file_by_title FILE "$TOPIC" "$TITLE"
EDITOR="${EDITOR:-vim}" # Default to vim if EDITOR isn't set

if [ -f "$FILE" ]; then
    $EDITOR "$FILE"
else
    echo "Topic note doesn't exist. Run: make new-topic"
fi
