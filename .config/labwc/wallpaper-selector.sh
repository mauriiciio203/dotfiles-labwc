#!/bin/sh
DIR="$HOME/Pictures/Wallpapers"

seleccion=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) -exec basename {} \; | \
  fzf --prompt="Wallpaper > " \
      --preview="chafa -f sixel -s \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES} '$DIR/{}'" \
      --preview-window=right:60%:wrap)

if [ -n "$seleccion" ]; then
    ruta_completa="$DIR/$seleccion"

    # 1. Aplicar fondo de pantalla
    killall swaybg 2>/dev/null
    setsid swaybg -i "$ruta_completa" -m fill >/dev/null 2>&1 &

    # 2. Generar paleta con pywal
    wal -i "$ruta_completa" -n -q

    # 3. Sincronizar Fuzzel (sólido, cuadrado y con bordes)
    if [ -f "$HOME/.cache/wal/colors-fuzzel.ini" ]; then
        cp "$HOME/.cache/wal/colors-fuzzel.ini" "$HOME/.config/fuzzel/fuzzel.ini"
    fi

    # 4. Guardar persistencia en autostart
    touch "$HOME/.config/labwc/autostart"
    sed -i '/swaybg/d;/wal -R/d' "$HOME/.config/labwc/autostart"
    echo "wal -R -n -q &" >> "$HOME/.config/labwc/autostart"
    echo "swaybg -i \"$ruta_completa\" -m fill &" >> "$HOME/.config/labwc/autostart"
fi
labwc --reconfigure
