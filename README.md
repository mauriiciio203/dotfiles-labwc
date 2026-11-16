# Labwc Dotfiles (Alpine Linux)

Configuración ligera y minimalista basada en el compositor **Labwc** para Wayland, diseñada específicamente para entornos en **Alpine Linux**, optimizada con `fuzzel`, `foot`, `swaybg` y tematización limpia sin bordes.

---

## 🚀 Características

* **Labwc**: Compositor rápido y altamente personalizable estilo Openbox.
* **Fuzzel**: Lanzador de aplicaciones y menús contextuales rápido y ligero.
* **Foot**: Emulador de terminal rápido basado en Wayland.
* **Swaybg**: Administrador de fondos de pantalla con restauración automática del último wallpaper.
* **Menú de Energía**: Script interactivo con `fuzzel` para apagar, reiniciar o cerrar sesión usando privilegios seguros (`doas`).

---

## 📦 Dependencias Necesarias

Antes de instalar los dotfiles, asegúrate de tener instalado el compositor, las herramientas esenciales y los paquetes requeridos ejecutando el siguiente comando en tu terminal con `doas`:

```sh
doas apk update
doas apk add labwc swaybg fuzzel foot fastfetch git curl

# 1. Clona el repositorio en tu equipo
git clone https://github.com/mauriiciio203/dotfiles-labwc.git
cd dotfiles-labwc

# 2. Dale permisos de ejecución al script instalador
chmod +x install.sh

# 3. Ejecuta el instalador
./install.sh

IMPORTANTE AL FINAL UTILIZA ESTE COMANDO PARA REINICIAR RODA LA CONFIGURACION DE LABWC

labwc --reconfigure
