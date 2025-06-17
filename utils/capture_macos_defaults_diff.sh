#!/bin/bash

# Create temporary files for 'before' and 'after' states
before_file=$(mktemp /tmp/before.XXXXXX) # Temporary file with a unique suffix
after_file=$(mktemp /tmp/after.XXXXXX)   # Second temporary file with a unique suffix

# Create a unique name for the diff file with a timestamp
diff_file="defaults_diff_$(date +%Y%m%d_%H%M%S).txt"

# Read current defaults and save to the 'before' temporary file
defaults read >"$before_file"

# Prompt user action to make system changes before proceeding
echo "Make your system changes, then press any key to continue..."
read -n 1 -s # Waits for the user to press any key without showing the input

# Read current defaults again and save to the 'after' temporary file
defaults read >"$after_file"

# Create a diff of the 'before' and 'after' temporary files and save it
diff "$before_file" "$after_file" >"$diff_file"

# Check if the diff file has content (differences exist)
if [ -s "$diff_file" ]; then
  echo "Differences found:"
  bat "$diff_file"
else
  echo "No differences found between the before and after states."
fi

# Clean up temporary files
rm "$before_file" "$after_file"

# Notify user of where the diff is stored
echo "Diff saved in $diff_file"
