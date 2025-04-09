#!/bin/bash

STATUS=$1
FILE="todo.md"

case "$STATUS" in
    todo)     SYMBOL="\[ \]" ;;
    progress) SYMBOL="\[~\]" ;;
    done)     SYMBOL="\[x\]" ;;
    *) echo "Usage: $0 {todo|progress|done}"; exit 1 ;;
esac

nl -w2 -s'. ' "$FILE" | grep "$SYMBOL"