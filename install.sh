#!/bin/sh
echo "==> Instalando configuraciones de Labwc..."

mkdir -p ~/.config/labwc
mkdir -p ~/.config/foot
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/fastfetch
mkdir -p ~/.local/share/themes/sin-bordes/openbox-3
mkdir -p ~/Pictures/Wallpapers

if [ -f "dotfiles-labwc.tar.gz" ]; then
    tar -xzvf dotfiles-labwc.tar.gz -C ~/
    echo "==> Archivos extraídos correctamente."
elif [ -f "dotfiles-labwc" ]; then
    tar -xzvf dotfiles-labwc -C ~/
    echo "==> Archivos extraídos correctamente."
else
    echo "[!] No se encontró el paquete de respaldo en este directorio."
fi

[ -f ~/.config/labwc/wallpaper-selector.sh ] && chmod +x ~/.config/labwc/wallpaper-selector.sh
[ -f ~/.config/labwc/autostart ] && chmod +x ~/.config/labwc/autostart
[ -f ~/.config/labwc/power-menu.sh ] && chmod +x ~/.config/labwc/power-menu.sh
[ -f ~/.config/labwc/screenshot-menu.sh ] && chmod +x ~/.config/labwc/screenshot-menu.sh

echo "==> ¡Instalación completa! Ejecuta 'labwc --reconfigure'."
