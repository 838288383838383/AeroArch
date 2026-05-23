#!/bin/bash
set -e
echo "🚀 Setting up AeroArch - Frutiger Aero Edition..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm - < ../packages.txt

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

yay -S --noconfirm - < ../aur-packages.txt

./theme-apply.sh
echo "✅ AeroArch setup finished! Reboot and enjoy."