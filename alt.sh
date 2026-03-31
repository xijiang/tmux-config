#!/bin/bash
# Usage: ./tmux-session-manager.sh [session_name]

SESSION_NAME="${1:-main}"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Attaching to existing session '$SESSION_NAME'..."
    exec tmux attach-session -t "$SESSION_NAME"
else
    echo "Creating new session '$SESSION_NAME' with setup-session.conf..."
    # Create the session detached, source the setup, then attach
    tmux new-session -d -s "$SESSION_NAME"
    tmux source-file ~/.config/tmux/setup-session.conf
    exec tmux attach-session -t "$SESSION_NAME"
fi
