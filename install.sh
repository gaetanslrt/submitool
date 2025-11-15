#!/bin/bash

# Submitool installer
# By Gaetan Suillerot

set -e

echo "Installing Submitool..."

# Destination directory in AFS
INSTALL_DIR="$HOME/afs/.local/bin"
SCRIPT_NAME="submitool"

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy the script
cp "src/$SCRIPT_NAME" "$INSTALL_DIR/"

# Make it executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Add to PATH if not already present
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "Adding $INSTALL_DIR to PATH in .bashrc"
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
    
    # Also add to .bash_profile for login shells
    if [[ -f "$HOME/.bash_profile" ]]; then
        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bash_profile"
    fi
fi

echo ""
echo "✓ Submitool installed successfully!"
echo "📁 Installed in: $INSTALL_DIR/$SCRIPT_NAME"
echo ""
echo "To use it immediately, run:"
echo "  source ~/.bashrc"
echo ""
echo "Then you can use 'submitool' anywhere in your git repositories!"
echo ""
echo "For updates, visit: https://github.com/gaetanslrt/submitool"
