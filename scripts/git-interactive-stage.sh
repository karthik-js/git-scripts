#!/bin/bash

set -e

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "❌ Error: fzf is required but not installed."
    echo "Please install fzf first: https://github.com/junegunn/fzf#installation"
    exit 1
fi

# Get list of modified files
modified_files=$(git status --porcelain | awk '{print $2}')

if [ -z "$modified_files" ]; then
    echo "✨ No modified files found."
    exit 0
fi

# Use fzf to select files interactively
echo "📋 Select files to stage (use TAB to select multiple, ENTER when done):"
selected_files=$(echo "$modified_files" | fzf -m --preview 'git diff --color=always {}' --preview-window=right:70%:wrap)

if [ -z "$selected_files" ]; then
    echo "❌ No files selected."
    exit 0
fi

# Stage selected files
echo "📥 Staging selected files..."
echo "$selected_files" | xargs git add

# Show staged changes
echo -e "\n📝 Staged changes:"
git diff --cached --stat

echo "✅ Files staged successfully!" 