#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROFI_THEME="$SCRIPT_DIR/style.rasi"
YT_MUSIC_DL="/usr/bin/mudow"

# Checks if the music downloader script exists
if [[ ! -x "$YT_MUSIC_DL" ]]; then
    rofi -e "Error: mudow not found in ~/usr/bin/" -theme "$ROFI_THEME"
    exit 1
fi

# URL
URL=$(rofi -dmenu \
    -p "YouTube URL: " \
    -mesg "Paste the YouTube video or playlist URL" \
    -theme "$ROFI_THEME")

[[ -z "$URL" ]] && exit 0

# Optional destination folder
DEST=$(rofi -dmenu \
    -p "Destination (optional)" \
    -mesg "Leave empty for default:  ~/Music/$(date +%F)-music" \
    -theme "$ROFI_THEME")

# URL Type
TYPE=$(echo -e " Single video\n󰉍 Playlist" | rofi -dmenu \
    -p "Download type" \
    -theme "$ROFI_THEME" \
    -selected-row 0)

[[ -z "$TYPE" ]] && exit 0

# Builds command
CMD="$YT_MUSIC_DL"
[[ -n "$DEST" ]] && CMD="$CMD -p '$DEST'"
[[ "$TYPE" == "󰉍 Playlist" ]] && CMD="$CMD -P"
CMD="$CMD '$URL'"

# Confirmation
CONFIRM=$(echo -e "󰸞 Download\n Cancel" | rofi -dmenu \
    -p "Ready to download" \
    -mesg "Command: $CMD" \
    -theme "$ROFI_THEME" \
    -selected-row 0)

# Execution
if [[ "$CONFIRM" == "󰸞 Download" ]]; then
    eval "$CMD" && notify-send "YouTube Download" "󰸞 Completed!" || notify-send "YouTube Download" " Failed!"
fi
