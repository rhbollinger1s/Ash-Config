{ config, pkgs, lib, ... }:
# rhbollinger1s, 2025
# "If I spend 1,000 years writing 10,000 comments,
# then I will have wasted my life.
# However, if one man reads one of my comments,
# he will have wasted his time too,
# and it will all have been worth it."

{

  imports =
    [
      ./hardware-configuration.nix
      ../../../Modules/Packages/Kits/VMKit.nix
      ../../../Modules/Drivers/GPU/Nivida/NividaOldDriver.nix
      ../../../Modules/Audio/PipeWire.nix
      ../../../Modules/LightDM.nix
      ../../../Modules/DevKit.nix
      ../../../Modules/Bootloaders/SystemDBoot.nix

    ];

specialisation = {
    i3-variant.configuration = {
      imports = [ ../../../Modules/Desktop/i3.nix ];
      system.nixos.tags = [ "i3" ];
    };
    cinnamon-variant.configuration = {
      imports = [ ../../../Modules/Desktop/Cinnamon.nix ];
      system.nixos.tags = [ "cinnamon" ];
    };
  };

# ----- [ X11 ] ------------------------------
  services = {
    xserver.enable = true; # Enables X11
   };

# ----- [ KERNEL and FIRMWARE ] ------------------------------
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  hardware.firmware = [ pkgs.linux-firmware ];

# ----- [ HOSTNAME ] ------------------------------
  networking.hostName = "PaleKing";

# ----- [ NETWORKING AND WIFI ] ------------------------------
  networking.networkmanager.enable = true;

# ----- [ TIME AND INTERNATIONALIZATION ] ------------------------------
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

# ----- [ SUID WRAPPERS ] ------------------------------
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

# ----- [ USER ACCOUNTS ] ------------------------------
  users.users.monoUser = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "robert";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
       gparted
    ];
  };
  users.users.guest = {
    shell = pkgs.bash;
    isNormalUser = true;
    description = "guest user for monolith config";
    extraGroups = [  ];
    packages = with pkgs; [
    ];
  };

# ----- [ PROGRAMS ] ------------------------------
  nixpkgs.config.allowUnfree = true;

  # "Installed Packages"
  environment.systemPackages = with pkgs; [

    jetbrains-mono

  # "Terminal Emulators"
  kitty

  # "File Managers & Text Editors (CLI + GUI)"
  kdePackages.dolphin
  kdePackages.kate
  nano
  neovim
  ranger
  vim

  # "System Info & Eye Candy"
  asciiquarium
  btop
  bottom
  cmatrix
  fastfetch
  htop
  lolcat
  procs

  # "Web & Media"
  chromium
  firefox
  mpv
  vlc
  yt-dlp

  # Productivity & Office
  anki
  calibre
  libreoffice-qt-fresh
  obsidian
  thunderbird
  zathura
  kdePackages.kdenlive

  # Core CLI Utilities
  curl
  git
  gnupg
  less
  unzip
  wget

  # Modern CLI Replacements
  bat
  delta
  eza
  fd
  fzf
  ripgrep
  zoxide

  # Development and Container Tools
  direnv
  docker
  lazydocker
  nixpkgs-fmt
  podman
  vscode

  # Gaming
  gamemode
  godot
  lutris
  mangohud
  protonup-qt
  steam-run
  superTuxKart

  # "Creative & Multimedia"
  audacity
  blender
  gimp
  handbrake
  inkscape
  krita
  obs-studio

  # "System Maintenance & Hardware"
  lm_sensors
  pciutils
  pavucontrol
  smartmontools
  usbutils

  # "Security & Privacy"
  keepassxc
  tor-browser
  yubikey-manager

  # "Runtime & Compatibility"
  gnome-boxes
  wine

  # Nix Eco Utilities
  nix-index
  nix-tree

  ];

  programs.firefox.enable = true;
  programs.starship.enable = true;

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  };

  # Fish Shell Config
  programs.fish = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";
      cmat = "cmatrix -Bs";
    };
    shellInit = "echo 'NixOS btw'";
  };

# ----- [ SERVICES and STUFF ] ------------------------------
  # Cups printing
  services.printing.enable = true;

  # Fail2ban enabled
  services.fail2ban.enable = true;

  # rtkit enabled
  security.rtkit.enable = true;

  services.openssh.enable = true;

  # "Firmware updating software"
  services.fwupd.enable = true;

  # "Power profiles"
  services.power-profiles-daemon.enable = true;

# ----- [ FLAKES ] ------------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ----- [ FIREWALL ] ------------------------------
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];  # SSH, HTTP, HTTPS
  networking.firewall.allowPing = true;
  networking.firewall.enable = true;

# ----- [ OBS-STUDIO ] ------------------------------
programs.obs-studio = {
  enable = true;
  plugins = with pkgs.obs-studio-plugins; [
    obs-backgroundremoval
    obs-pipewire-audio-capture
  ];
};

# ----- [ STATE VERSION ] ------------------------------
  system.stateVersion = "25.11";
}
