# Poemwc Alpine Linux dotfiles o "cualquier otra distro"

Configuración ligera y minimalista basada en el compositor **Labwc** para Wayland, diseñada específicamente para entornos en **Alpine Linux** y compatible con otras distribuciones, optimizada con `fuzzel`, `foot`, `swaybg` y tematización limpia sin bordes.

---

## 🚀 Características

* **Labwc**: Compositor rápido y altamente personalizable estilo Openbox.
* **Fuzzel**: Lanzador de aplicaciones y menús contextuales rápido y ligero.
* **Foot**: Emulador de terminal rápido basado en Wayland.
* **Swaybg**: Administrador de fondos de pantalla con restauración automática del último wallpaper.
* **Menú de Energía Universal**: Script interactivo con `fuzzel` para apagar, reiniciar o cerrar sesión compatible con `loginctl`, `sudo` y `doas`.

---

## 📦 Dependencias e Instalación

Antes de instalar los dotfiles, asegúrate de tener instalado el compositor y las herramientas esenciales (en Alpine Linux con `sudo` o `doas`):

```sh
sudo apk update
sudo apk add labwc swaybg fuzzel foot fastfetch git curl
