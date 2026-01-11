# Rofi YouTube Music Downloader

A simple and modern set of tools to download YouTube videos or playlists as mp3 — from your terminal or with a practical Rofi menu.

![Usage demo](./assets/demo.gif) <!-- Replace with your real GIF path -->

---

## Overview

This repository provides two complementary utilities:

### `mudow` (Music Downloader)

- **A minimal command-line wrapper around [yt-dlp](https://github.com/yt-dlp/yt-dlp)** to quickly download YouTube videos and playlists as high quality mp3s.
- Usable universally from any terminal, or in scripts.
- Specify a URL, a destination folder, and whether you want a playlist or a single video.

Example:
```sh
mudow https://youtube.com/watch?v=xxxxxxx
mudow --playlist https://youtube.com/playlist?list=xxxxxxx
mudow --path ~/Music/myfolder https://youtube.com/watch?v=xxxxxxx
```

*Requires: [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) installed on your system.*

---

### `rofi-music-dl` (Rofi GUI Music Downloader)

- **A fully customizable graphical menu built with [Rofi](https://github.com/davatorium/rofi)**, serving as an intuitive interface to `mudow`.
- Select your URL, destination, and type (video/playlist) directly via shortcut or keybind (perfect for Hyprland/sway/wayland workflows).
- Uses a clean One Dark theme and supports direct clipboard paste and user interaction.
- Easily tweak appearance, keybinds, colors through the included Rofi style configs.

*Requires: [`rofi`](https://github.com/davatorium/rofi) installed on your system (along with `yt-dlp`).*

---

## Why two tools?

- `mudow` is **universal**: works everywhere bash works, no GUI required.
- `rofi-music-dl` brings the same features in a beautiful, integrated visual menu that's ideal for desktop environments and workflow automation.

---

## Installation

Simply run the installation script

```sh
./install.sh
```

This will:
- Install `mudow` globally (`/usr/bin/mudow`)
- Copy the Rofi menu and its themes to `~/.config/rofi/rofi-music-dl`
- Let you launch the Rofi interface with `~/.config/rofi/rofi-music-dl/launch.sh`  
  (optionally, bind it to a key combo in your WM!)

---

## Requirements

- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) (for actual downloading and conversion)
- [`rofi`](https://github.com/davatorium/rofi) (only needed for the graphical launcher)

If on Arch, both are available with pacman and AUR:

```bash
pacman -S yt-dlp rofi
# Or with AUR, yay for example
yay -S yt-dlp rofi
```

---

## Customization

The menu style and launcher are fully hackable!  
Change colors, rounding, position, font, etc. in `~/.config/rofi/rofi-music-dl/style.rasi`  
Edit `launch.sh` to fit your workflow.
