#!/usr/bin/env bash

# Configuration
DEFAULT_DIR="$HOME/Music/$(date +%F)-music"

# Parse arguments
help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS] URL

Options:
    -p, --path DIR      Download directory (default: Music/DATE-music)
    -P, --playlist      Download entire playlist
    -h, --help          Show this help 

Examples:
    $(basename "$0") https://youtube.com/watch?v=xxxxx
    $(basename "$0") -p ~/Music/new-music -P https://youtube.com/playlist?list=xxxxx

EOF
}

PLAYLIST=false
DOWNLOAD_DIR=""

# Check if no arguments provided
if [[ $# -eq 0 ]]; then
    help
    exit 0
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--path)
            DOWNLOAD_DIR="$2"
            shift 2
            ;;
        -P|--playlist)
            PLAYLIST=true
            shift
            ;;
        -h|--help)
            help
            exit 0
            ;;
        *)
            URL="$1"
            shift
            ;;
    esac
done

# Validation
if [[ -z "$URL" ]]; then
    echo "Error: URL required"
    echo ""
    help
    exit 1
fi

# Set download directory
DOWNLOAD_DIR="${DOWNLOAD_DIR:-$DEFAULT_DIR}"
mkdir -p "$DOWNLOAD_DIR"

# yt-dlp options
OPTS=(
    --extract-audio
    --audio-format mp3
    --audio-quality 0
    --output "$DOWNLOAD_DIR/%(title)s.%(ext)s"
    --embed-thumbnail
    --add-metadata
)

[[ "$PLAYLIST" == false ]] && OPTS+=(--no-playlist)

# Download
yt-dlp "${OPTS[@]}" "$URL" && \
    echo -e "\e[33m✓ Downloaded to $DOWNLOAD_DIR\e[0m"
