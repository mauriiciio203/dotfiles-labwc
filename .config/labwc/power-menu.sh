#!/bin/sh
opcion=$(printf "Apagar\nReiniciar\nCerrar sesión" | fuzzel --dmenu -p "Sistema: ")

case "$opcion" in
    "Apagar") doas poweroff ;;
    "Reiniciar") doas reboot ;;
    "Cerrar sesión") labwc --exit ;;
esac
