#!/bin/bash

set -e

echo "🔄 Running smart git fetch..."

# Try fetch, log stderr in case of errors
if ! GIT_TRACE=0 git fetch 2>fetch_error.log; then
    error=$(cat fetch_error.log)
    echo "$error"

    # Extract the problematic ref from the error
    ref=$(echo "$error" | grep "cannot lock ref" | sed -n "s/.*'refs\/remotes\/origin\/\([^']*\)'.*/\1/p")

    if [[ -n "$ref" ]]; then
        echo "⚠️  Detected ref lock issue on: origin/$ref"

        # Check and remove parent directory if it's a file (fixes "not a directory" issue)
        top_level=$(echo "$ref" | cut -d'/' -f1)
        top_level_path=".git/refs/remotes/origin/$top_level"

        if [[ -f "$top_level_path" ]]; then
            echo "🪓 Removing conflicting file at: $top_level_path"
            rm -f "$top_level_path"
        fi

        # Remove the broken ref if it exists
        ref_path=".git/refs/remotes/origin/$ref"
        if [[ -f "$ref_path" ]]; then
            echo "🧹 Removing broken ref: $ref_path"
            rm -f "$ref_path"
        fi

        echo "🔁 Retrying fetch..."
        git fetch --prune --all
        echo "✅ Fetch successful after healing."
    else
        echo "❌ Unrecognized fetch error. Check fetch_error.log for details."
        exit 1
    fi
else
    echo "✅ Fetch completed successfully."
fi

# Clean up temp log
rm -f fetch_error.log

