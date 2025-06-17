#!/bin/bash

# Directory to store Brewfiles
BREWFILE_DIR="$HOME/brewfiles"

# Ensure the directory exists
mkdir -p "$BREWFILE_DIR"

# Get the current timestamp in a proper date format for files
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

# Define the Brewfile name
BREWFILE_NAME="Brewfile_$TIMESTAMP"

# Full path to the new Brewfile
BREWFILE_PATH="$BREWFILE_DIR/$BREWFILE_NAME"

# Dump the Brewfile
brew bundle dump --file="$BREWFILE_PATH" --force

# Notify the user
echo "Brewfile saved to: $BREWFILE_PATH"
