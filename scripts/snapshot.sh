#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

mkdir -p packages

pacman -Qqe > packages/pacman.txt

if command -v yay >/dev/null 2>&1; then
  yay -Qqe > packages/aur.txt
elif command -v paru >/dev/null 2>&1; then
  paru -Qqe > packages/aur.txt
else
  : > packages/aur.txt
fi

echo "Snapshot updated: packages/pacman.txt and packages/aur.txt"
