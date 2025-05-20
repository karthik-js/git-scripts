#!/bin/bash

set -e

echo "🧹 Cleaning up branches..."

# Get the current branch
current_branch=$(git symbolic-ref --short HEAD)

# Fetch all branches and prune remote-tracking branches
echo "📥 Fetching latest changes..."
git fetch --prune

# Get list of merged branches (excluding current branch and main/master)
echo "🔍 Finding merged branches..."
merged_branches=$(git branch --merged | grep -v "^\*" | grep -v "main" | grep -v "master" | tr -d ' ')

# Get list of branches with no remote tracking
echo "🔍 Finding branches with no remote tracking..."
no_remote_branches=$(git branch -vv | grep ': gone]' | awk '{print $1}')

# Combine and sort unique branches to delete
branches_to_delete=$(echo -e "${merged_branches}\n${no_remote_branches}" | sort -u)

if [ -z "$branches_to_delete" ]; then
    echo "✨ No branches to clean up!"
    exit 0
fi

echo "📋 Branches to be deleted:"
echo "$branches_to_delete"

# Ask for confirmation
read -p "Do you want to delete these branches? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "$branches_to_delete" | xargs git branch -D
    echo "✅ Branches cleaned up successfully!"
else
    echo "❌ Operation cancelled."
fi 