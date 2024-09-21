#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "============ Starting Podcast Feed Update ============"

# Configure git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Check if feed.py exists
if [ ! -f /usr/bin/feed.py ]; then
    echo "Error: feed.py not found!"
    exit 1
fi

echo "Running feed.py..."
python3 /usr/bin/feed.py

git add -A
git commit -m "Update Feed"

echo "Pushing changes to the repository..."
git push --set-upstream origin main

echo "============ Podcast Feed Update Complete ============"
