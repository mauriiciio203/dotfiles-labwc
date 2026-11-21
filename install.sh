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

# Configurar permisos de apagado/reinicio sin contraseña si no hay loginctl
if ! command -v loginctl >/dev/null 2>&1; then
    echo "===> Configurando permisos de apagado/reinicio para el menú de energía..."
    POWEROFF_BIN=$(command -v poweroff || echo "/sbin/poweroff")
    REBOOT_BIN=$(command -v reboot || echo "/sbin/reboot")
    if command -v sudo >/dev/null 2>&1; then
        echo "$USER ALL=(ALL) NOPASSWD: $POWEROFF_BIN, $REBOOT_BIN" | sudo tee /etc/sudoers.d/labwc-power >/dev/null
        sudo chmod 0440 /etc/sudoers.d/labwc-power
    elif command -v doas >/dev/null 2>&1; then
        echo "permit nopass $USER cmd $POWEROFF_BIN" | doas tee -a /etc/doas.conf >/dev/null
        echo "permit nopass $USER cmd $REBOOT_BIN" | doas tee -a /etc/doas.conf >/dev/null
    fi
fi

echo "===> ¡Instalación completa! Ejecuta 'labwc --reconfigure'."
