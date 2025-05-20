#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NO_COLOR='\033[0m'

# Column widths
width_branch=45
width_sha=12
width_status=12
width_date=20

# Fetch latest remotes quietly, prune deleted refs
git fetch --quiet --all --prune

# Get current branch name
current_branch=$(git symbolic-ref --quiet --short HEAD)

# Print header with colors
printf "${BLUE}%-2s %-${width_branch}s %-${width_sha}s %-${width_status}s %-${width_date}s${NO_COLOR}\n" "" "Branch" "Last SHA" "Status" "Last Commit Date"
printf "${BLUE}%-2s %-${width_branch}s %-${width_sha}s %-${width_status}s %-${width_date}s${NO_COLOR}\n" "--" "$(printf '%.0s-' $(seq 1 $width_branch))" "$(printf '%.0s-' $(seq 1 $width_sha))" "$(printf '%.0s-' $(seq 1 $width_status))" "$(printf '%.0s-' $(seq 1 $width_date))"

# Loop through all local branches sorted by last commit date (newest first)
for branch in $(git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/); do
    sha=$(git rev-parse --short "$branch")
    date=$(git log -1 --format="%cr" "$branch")

    # Get upstream remote branch (if any)
    upstream=$(git for-each-ref --format='%(upstream:short)' "refs/heads/$branch")
    if [[ -n "$upstream" ]]; then
        behind=$(git rev-list --count "$branch".."$upstream")
        if [[ "$behind" -gt 0 ]]; then
            status="${YELLOW}🟡 pull${NO_COLOR}"
        else
            status="${GREEN}✅ up-to-date${NO_COLOR}"
        fi
    else
        status="${RED}❌ no remote${NO_COLOR}"
    fi

    # Indicator for current branch
    indicator="  "
    [[ "$branch" == "$current_branch" ]] && indicator="👉"

    # Print the formatted line; %b interprets color codes in status
    printf "%-2s %-${width_branch}s %-${width_sha}s %-${width_status}b %-${width_date}s\n" \
        "$indicator" "$branch" "$sha" "$status" "$date"
done

