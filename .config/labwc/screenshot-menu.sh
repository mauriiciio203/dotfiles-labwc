#!/bin/sh
opcion=$(printf "Pantalla completa (Grim)\nSelección de área (Slurp+Grim)" | fuzzel --dmenu --prompt="Captura > " --lines=2 --width=30)
case "$opcion" in
    "Pantalla completa (Grim)")
        grim "$HOME/Pictures/screenshot_$(date +%Y%m%d_%H%M%S).png"
        ;;
    "Selección de área (Slurp+Grim)")
        grim -g "$(slurp)" "$HOME/Pictures/screenshot_$(date +%Y%m%d_%H%M%S).png"
        ;;
esac
