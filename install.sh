#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
ROFI_CONFIG_DIR="$HOME/.config/rofi/rofi-music-dl"
ROFI_SRC_DIR="$REPO_DIR/rofi"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   mudow & Rofi Music DL Installer${NC}"
echo -e "${BLUE}========================================${NC}\n"

# --- Install mudow ---
install_script() {
    local src="$1"
    local dest="/usr/bin/mudow"
    if [ -f "$dest" ]; then
        echo -e "${YELLOW}[WARN]${NC} $dest already exists."
        read -p "Wanna replace it? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}[SKIP]${NC} kept $dest"
            return
        fi
    fi
    sudo cp "$src" "$dest"
    sudo chmod +x "$dest"
    echo -e "${GREEN}[OK]${NC} Installed mudow -> $dest"
}

# --- Copy Rofi config ---
copy_rofi_config() {
    mkdir -p "$ROFI_CONFIG_DIR"
    for f in "$ROFI_SRC_DIR"/*; do
        # recurse for colors dir
        if [ -d "$f" ]; then
            cp -r "$f" "$ROFI_CONFIG_DIR/"
        elif [ -f "$f" ]; then
            cp "$f" "$ROFI_CONFIG_DIR/"
        fi
    done
    echo -e "${GREEN}[OK]${NC} Copied Rofi menu configs to $ROFI_CONFIG_DIR"
}

# 1. Install mudow script
echo -e "${BLUE}[1/2]${NC} Installing mudow.sh to /usr/bin/mudow..."
install_script "$REPO_DIR/mudow.sh"

# 2. Copy Rofi config
echo -e "\n${BLUE}[2/2]${NC} Installing Rofi Music DL config..."
copy_rofi_config

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}       Finished installation! ${NC}"
echo -e "${GREEN}========================================${NC}\n"
echo -e "${YELLOW}Notes :${NC}"
echo "  - mudow is available as a global command"
echo "  - rofi-music-dl configs are under ~/.config/rofi/rofi-music-dl"
echo "  - To launch: ~/.config/rofi/rofi-music-dl/launch.sh"
echo "  - You can symlink or set a keybind to the launcher if desired"
echo ""
