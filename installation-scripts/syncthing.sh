#!/usr/bin/env bash

set -e

echo "→ Installing Syncthing..."
sudo pacman -S --noconfirm syncthing

echo "→ Enabling user service..."
systemctl --user enable syncthing

echo "→ Starting Syncthing..."
systemctl --user start syncthing

echo "→ Ensuring it runs without login..."
loginctl enable-linger "$USER"

echo "→ Done. Open UI at http://localhost:8384"
