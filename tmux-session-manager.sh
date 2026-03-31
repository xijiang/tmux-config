#!/bin/bash
# ============================================
# Tmux session manager script (Hostname-aware)
# Usage: Add 'alias mytmux="~/.config/tmux/tmux-session-manager.sh"' to your .bashrc
# ============================================

# Use current hostname (lower case) to identify the machine
HOSTNAME=$(hostname | tr '[:upper:]' '[:lower:]')

# If the hostname isn't one of the known ones, use 'default'
case "$HOSTNAME" in
    simple|amd|svr|wsl|lt)
        MACHINE="$HOSTNAME"
        ;;
    *)
        MACHINE="default"
        ;;
esac

SESSION_NAME="$(echo $MACHINE | sed 's/./\u&/')-Session" # E.g., 'Simple-Session'
SETUP_FILE="$HOME/.config/tmux/setup-$MACHINE.conf"

# Ensure the setup file exists, otherwise fallback to setup-simple.conf
if [ ! -f "$SETUP_FILE" ]; then
    SETUP_FILE="$HOME/.config/tmux/setup-simple.conf"
fi

# Check if tmux is already running
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Attaching to existing session '$SESSION_NAME'..."
    exec tmux attach-session -t "$SESSION_NAME"
else
    echo "Creating new session '$SESSION_NAME' for '$MACHINE'..."
    tmux new-session -s "$SESSION_NAME" -d
    tmux source-file "$SETUP_FILE"
    exec tmux attach-session -t "$SESSION_NAME"
fi