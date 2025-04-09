#!/bin/bash

cd "$(dirname "$0")/.." || exit 1

MESSAGE=":memo: Auto-commit on $(date '+%Y-%m-%d %H:%M:%S')"
git add .
if ! git diff --cached --quiet; then
    git commit -m "$MESSAGE"
    echo "Committed changes with message: $MESSAGE"

    # Log to CHANGELOG.txt
    echo "- $MESSAGE" >> "CHANGELOG.txt"

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
