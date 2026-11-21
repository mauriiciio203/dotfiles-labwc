# Poemwc Alpine linux dotfiles o "cualquier otra distro"

Configuración ligera y minimalista basada en el compositor **Labwc** para Wayland, diseñada específicamente para entornos en **Alpine Linux**, optimizada con `fuzzel`, `foot`, `swaybg` y tematización limpia sin bordes.

## 🚀 Características

* **Labwc**: Compositor rápido y altamente personalizable estilo Openbox.

* **Fuzzel**: Lanzador de aplicaciones y menús contextuales rápido y ligero.

* **Foot**: Emulador de terminal rápido basado en Wayland.

* **Swaybg**: Administrador de fondos de pantalla con restauración automática del último wallpaper.

* **Menú de Energía**: Script interactivo con `fuzzel` para apagar, reiniciar o cerrar sesión usando privilegios seguros (`doas`).

## 📦 Dependencias Necesarias

Antes de instalar los dotfiles, instala el compositor, las utilidades de Wayland, audio, red, tematización y fuentes según tu distribución.

### Dependencias incluidas

* **Entorno Wayland:** `labwc`, `foot`, `fuzzel`, `swaybg`

* **Tematización y wallpapers:** `pywal`, `imagemagick`, `fzf`, `chafa`, `psmisc` (`killall`)

* **Audio y capturas:** `pipewire`, `wireplumber` (`wpctl`), `pipewire-pulse`, `grim`, `slurp`

* **Sistema y portales:** `xdg-desktop-portal`, `xdg-desktop-portal-wlr`, `dbus`, `networkmanager` (`nmtui`)

* **Utilidades del menú y fuente:** `htop`, `cava`, `pfetch` / `fastfetch`, `JetBrains Mono`, `git`, `curl`

### 🏔️ Alpine Linux

```sh
doas apk update
doas apk add \
  labwc foot fuzzel swaybg \
  pywal imagemagick fzf chafa \
  pipewire wireplumber pipewire-pulse \
  grim slurp \
  xdg-desktop-portal xdg-desktop-portal-wlr dbus \
  networkmanager networkmanager-tui htop cava fastfetch \
  font-jetbrains-mono git curl
```

Habilita `dbus` y `networkmanager` para que funcione `nmtui` (`Super + N`):

```sh
doas rc-update add dbus default
doas rc-update add networkmanager default
doas rc-service dbus start
doas rc-service networkmanager start
```

### 🏹 Arch Linux

Instala los paquetes principales desde los repositorios oficiales:

```sh
sudo pacman -S --needed \
  labwc foot fuzzel swaybg \
  fzf chafa imagemagick psmisc \
  pipewire wireplumber pipewire-pulse \
  grim slurp \
  xdg-desktop-portal xdg-desktop-portal-wlr dbus \
  networkmanager htop cava pfetch-rs fastfetch \
  ttf-jetbrains-mono git curl
```

Habilita `NetworkManager` para que funcione `nmtui` (`Super + N`):

```sh
sudo systemctl enable --now NetworkManager
```

Si aún no tienes un asistente de AUR, instala `yay`:

```sh
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
```

Luego instala `pywal` desde el AUR:

```sh
yay -S python-pywal
```

> **Nota para Arch:** Si usas scripts que llaman a `doas` (como `.config/labwc/scripts/powermenu.sh`), instala también `opendoas`. Además, en `.config/labwc/autostart` los portales en Arch están en `/usr/lib/` en lugar de `/usr/libexec/`.

### 🌀 Void Linux

```sh
sudo xbps-install -S \
  labwc foot fuzzel swaybg \
  pywal ImageMagick fzf chafa psmisc \
  pipewire wireplumber \
  grim slurp \
  xdg-desktop-portal xdg-desktop-portal-wlr dbus \
  NetworkManager htop cava fastfetch \
  nerd-fonts-ttf git curl
```

Habilita los servicios `dbus` y `NetworkManager` en `runit` para que funcione `nmtui` (`Super + N`):

```sh
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
```

> **Nota para Void:** Asegúrate de tener configurada la fuente `JetBrains Mono` (o descarga la fuente manualmente en `~/.local/share/fonts/`).

### ❄️ NixOS

Agrega los paquetes, fuentes y servicios en tu `/etc/nixos/configuration.nix` (la opción `networking.networkmanager.enable = true;` ya habilita e inicia el servicio de red para `nmtui`):

```nix
{ pkgs, ... }:

{
  # Servicios base necesarios
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Paquetes del entorno
  environment.systemPackages = with pkgs; [
    labwc
    foot
    fuzzel
    swaybg
    pywal
    imagemagick
    fzf
    chafa
    psmisc
    grim
    slurp
    htop
    cava
    pfetch-rs
    fastfetch
    git
    curl
  ];

  # Fuente configurada en fuzzel
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
```

Luego aplica la configuración con:

```sh
sudo nixos-rebuild switch
```

## 🛠️ Instalación

```sh
# 1. Clona el repositorio en tu equipo
git clone https://github.com/mauriiciio203/dotfiles-labwc.git
cd dotfiles-labwc

# 2. Dale permisos de ejecución al script instalador
chmod +x install.sh

# 3. Ejecuta el instalador
./install.sh
```

IMPORTANTE: AL FINAL UTILIZA ESTE COMANDO PARA REINICIAR TODA LA CONFIGURACIÓN DE LABWC:

```sh
labwc --reconfigure
```

## ⌨️ Uso y Atajos de Teclado (Keybindings)

| Atajo | Acción |
| :--- | :--- |
| `Super` + `D` | Abre el lanzador de aplicaciones **Fuzzel**. |
| `Super` + `W` | Lanza el selector dinámico de fondos de pantalla. |
| `Super` + `M` | Abre el **Menú de Energía**. |
| `Super` + `N` | Abre el gestor de red (`nmtui`). |
| `Super` + `Enter` | Abre la terminal **Foot**. |
