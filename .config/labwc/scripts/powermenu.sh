#!/bin/sh

chosen="$(printf "Apagar\nReiniciar\nCerrar Sesión" | fuzzel -d -p 'Menu: ')"

case "$chosen" in
    Apagar) doas poweroff ;;
    Reiniciar) doas reboot ;;
    "Cerrar Sesión") loginctl terminate-user $USER ;;
esac
