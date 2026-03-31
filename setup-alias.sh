#!/bin/bash
# ============================================
# Script to add 'mytmux' alias to ~/.bashrc
# ============================================

# The target path for the configuration as per README
TARGET_PATH="$HOME/.config/tmux/tmux-session-manager.sh"
ALIAS_NAME="mytmux"
ALIAS_LINE="alias $ALIAS_NAME=\"$TARGET_PATH\""
BASHRC="$HOME/.bashrc"

# Check if the alias already exists
if grep -q "alias $ALIAS_NAME=" "$BASHRC"; then
    echo "---"
    echo "Info: Alias '$ALIAS_NAME' already exists in $BASHRC"
    echo "Current definition: $(grep "alias $ALIAS_NAME=" "$BASHRC")"
    echo "---"
else
    # Add a newline and a comment for clarity
    echo -e "\n# Tmux session manager alias\n$ALIAS_LINE" >> "$BASHRC"
    echo "---"
    echo "Success: Added '$ALIAS_NAME' alias to $BASHRC"
    echo "Please run: source ~/.bashrc"
    echo "---"
fi
