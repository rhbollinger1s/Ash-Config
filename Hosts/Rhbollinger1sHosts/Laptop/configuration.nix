{ config, pkgs, ... }: {
# rhbollinger1s, 2025
# "If I spend 1,000 years writing 10,000 comments,
# then I will have wasted my life.
# However, if one man reads one of my comments,
# he will have wasted his time too,
# and it will all have been worth it."

# ----- [ IMPORTS ] ------------------------------
  imports =
    [
      ./hardware-configuration.nix
      ../../../Modules/Kernels/LatestKernel.nix
      ../../../Modules/Audio/PipeWire.nix
      ../../../Modules/Bootloaders/Grub.nix
     # ../../../Modules/Desktop/i3.nix
     # ../../../Modules/DisplayManager/LY.nix
    ];
specialisation = {
  hyprland.configuration = {
    imports = [ ../../../Modules/Desktop/Hyprland.nix ];
    system.nixos.tags = [ "Hyprland" ];
  };
  i3.configuration = {
    imports = [ ../../../Modules/Desktop/i3.nix ];
    system.nixos.tags = [ "i3wm" ];
  };
};
# ----- [ HOSTNAME ] ------------------------------
  networking.hostName = "TheHollowKnight";

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

# ----- [ USER ACCOUNTS ] ------------------------------
  users.users.robert= {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "password123";
    description = "Robert";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [  ];
  };

# ----- [ PROGRAMS ] ------------------------------
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  jetbrains-mono
  kitty
  kdePackages.dolphin
  kdePackages.kate
  nano
  neovim
  ranger
  vim
  asciiquarium
  btop
  bottom
  cmatrix
  fastfetch
  htop
  lolcat
  procs
  firefox
  mpv
  vlc
  yt-dlp
  libreoffice-qt-fresh
  obsidian
  curl
  git
  gnupg
  less
  unzip
  wget
  ripgrep
  godot
  inkscape
  obs-studio
  lm_sensors
  pciutils
  pavucontrol
  smartmontools
  usbutils
  keepassxc
  wine
  i3-auto-layout
  kdePackages.falkon
  ];
  programs.starship.enable = true;
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";
      cmat = "cmatrix -Bs";
    };
    shellInit = "echo 'NixOS btw'";
  };
  programs.firefox.enable = true;
  services.printing.enable = true;
  services.fail2ban.enable = true;
  security.rtkit.enable = true;
  services.fwupd.enable = true;
  services.power-profiles-daemon.enable = true;
  networking.networkmanager.enable = true;
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;
  services.displayManager.defaultSession = "none+i3";

# ----- [ FIREWALL ] ------------------------------
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.allowPing = true;
  networking.firewall.enable = true;
  services.openssh.enable = true;

# ----- [ FLAKES ] ------------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ----- [ STATE VERSION ] ------------------------------
  system.stateVersion = "25.11" ;

}
