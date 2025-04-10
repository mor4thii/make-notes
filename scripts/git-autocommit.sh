#!/usr/bin/env bash

source scripts/shared.sh

get_data_folder DATA_FOLDER
MAKE_NOTES_ROOT="$(dirname "$0")/.."
cd "${DATA_FOLDER:-$MAKE_NOTES_ROOT}" || exit 1

MESSAGE="${1:-:memo: Auto-commit on $(date '+%Y-%m-%d %H:%M:%S')}"
git add .
if ! git diff --cached --quiet; then
    git commit -m "$MESSAGE"
    echo "Committed changes with message: $MESSAGE"

    # Try to push if remote is configured
    if git remote show origin > /dev/null 2>&1; then
        git push
        echo "Pushed to remote."
    else
        echo "No remote found. Skipping push."
    fi
else
    echo "No changes to commit."
fi
