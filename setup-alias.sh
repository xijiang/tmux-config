#!/bin/bash
# ============================================
# Script to add 'mytmux' alias to ~/.bashrc
# ============================================

# The target path for the configuration as per README
# Use literal $HOME to ensure it's evaluated correctly in .bashrc
TARGET_PATH='$HOME/.config/tmux/tmux-session-manager.sh'
ALIAS_NAME="mytmux"
ALIAS_LINE="alias $ALIAS_NAME=\"$TARGET_PATH\""
BASHRC="$HOME/.bashrc"

# Check if the alias already exists
if grep -q "^alias $ALIAS_NAME=" "$BASHRC"; then
    # Get the current definition
    CURRENT_DEF=$(grep "^alias $ALIAS_NAME=" "$BASHRC")
    
    if [ "$CURRENT_DEF" == "$ALIAS_LINE" ]; then
        echo "---"
        echo "Info: Alias '$ALIAS_NAME' already exists and is correct in $BASHRC"
        echo "Definition: $CURRENT_DEF"
        echo "---"
    else
        echo "---"
        echo "Info: Alias '$ALIAS_NAME' exists but is different. Updating..."
        echo "Current: $CURRENT_DEF"
        echo "New:     $ALIAS_LINE"
        
        # Escape $ for the shell to prevent premature expansion when calling sed
        SAFE_ALIAS_LINE="${ALIAS_LINE//$/\\$}"
        sed -i "s|^alias $ALIAS_NAME=.*|$SAFE_ALIAS_LINE|" "$BASHRC"
        
        echo "Success: Updated '$ALIAS_NAME' alias in $BASHRC"
        echo "Please run: source ~/.bashrc"
        echo "---"
    fi
else
    # Add a newline and a comment for clarity
    SAFE_ALIAS_LINE="${ALIAS_LINE//$/\\$}"
    echo -e "\n# Tmux session manager alias\n$SAFE_ALIAS_LINE" >> "$BASHRC"
    echo "---"
    echo "Success: Added '$ALIAS_NAME' alias to $BASHRC"
    echo "Please run: source ~/.bashrc"
    echo "---"
fi
