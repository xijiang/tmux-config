# ============================================
# Tmux Setup (Multi-Computer)
# ============================================

This repository contains a unified tmux configuration for multiple computers: `simple`, `amd`, `svr`, `wsl`, and `lt`.

## Features
- **Machine Detection**: Automatically detects the hostname to set the session name and window layout.
- **Unified Config**: Key bindings (Emacs mode), status bar, and settings are shared across all machines.
- **Custom Layouts**: Each machine has its own layout file (e.g., `setup-simple.conf`).

## How it Works
The configuration uses your machine's **hostname** (converted to lowercase) to determine which setup file to load.
- **Session Name**: `[Hostname]-Session` (e.g., `Simple-Session`).
- **Setup File**: `~/.config/tmux/setup-[hostname].conf`.

## Machine Window Layouts
- **simple**: `status`, `JuliaBnG`, `Diary`, `Blog`, `Eff.Curves`, `Misc`.
- **amd**: `status`, `main`, `alt`.
- **svr**, **wsl**, **lt**: `main`, `alt`.

Each window is split into two panes (left/right) for multi-tasking.

## Installation

### 1. Link Configuration
Ensure these files are located in `~/.config/tmux/`:
```bash
mkdir -p ~/.config/tmux
# Clone or link these files into ~/.config/tmux/
```

### 2. Setup Alias
You can use the provided script to add the `mytmux` alias to your `~/.bashrc`:
```bash
chmod +x setup-alias.sh
./setup-alias.sh
source ~/.bashrc
```

## Usage
Run the alias to start or attach to your session:
```bash
mytmux
```

## Maintenance
To add a new computer:
1.  Create a new `setup-[hostname].conf` file in this directory.
2.  Customize the window layout in that file.
3.  The `tmux-session-manager.sh` will automatically detect it based on the `hostname`.
