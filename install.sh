#!/bin/sh
echo "===> Instalando configuraciones definitivas de Labwc..."

mkdir -p ~/.config/labwc
mkdir -p ~/.config/foot
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/wal/templates
mkdir -p ~/.local/share/themes/sin-bordes/openbox-3
mkdir -p ~/Pictures/Wallpapers

if [ -f "dotfiles-labwc.tar.gz" ]; then
    tar -xzvf dotfiles-labwc.tar.gz -C ~/
    echo "===> Archivos extraídos correctamente."
else
    echo "[!] No se encontró el paquete de respaldo en este directorio."
fi

# Enlazar tema del menú Labwc con la paleta dinámica de Pywal
ln -sf ~/.cache/wal/labwc-themerc ~/.local/share/themes/sin-bordes/openbox-3/themerc

[ -f ~/.config/labwc/wallpaper-selector.sh ] && chmod +x ~/.config/labwc/wallpaper-selector.sh
[ -f ~/.config/labwc/autostart ] && chmod +x ~/.config/labwc/autostart
[ -f ~/.config/labwc/power-menu.sh ] && chmod +x ~/.config/labwc/power-menu.sh
[ -f ~/.config/labwc/screenshot-menu.sh ] && chmod +x ~/.config/labwc/screenshot-menu.sh

echo "===> ¡Instalación completa! Ejecuta 'labwc --reconfigure'."
