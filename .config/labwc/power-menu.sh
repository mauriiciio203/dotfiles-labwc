#!/bin/sh
seleccionada=$(printf "Apagar\nReiniciar\nCerrar sesión" | fuzzel --dmenu -p "Sistema: ")

case "$seleccionada" in
    "Apagar") doas poweroff || sudo poweroff ;;
    "Reiniciar") doas reboot || sudo reboot ;;
    "Cerrar sesión") labwc --exit ;;
esac
