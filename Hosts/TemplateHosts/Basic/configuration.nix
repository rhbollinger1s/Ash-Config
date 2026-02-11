{ config, pkgs, ... }: {
# rhbollinger1s, 2025
# "If I spend 1,000 years writing 10,000 comments,
# then I will have wasted my life.
# However, if one man reads one of my comments,
# he will have wasted his time too,
# and it will all have been worth it."

# ----- [ IMPORTS ] ------------------------------
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../../Modules/Kernels/LTSKernel.nix
      ../../../Modules/Audio/PipeWire.nix
      ../../../Modules/Bootloaders/SystemDBoot.nix
      ../../../Modules/Desktop/Gnome.nix
      ../../../Modules/DisplayManager/GDM.nix
    ];

# ----- [ HOSTNAME ] ------------------------------
  networking.hostName = "ash-Basic";

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
  users.users.ashUser= {
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "password123";
    description = "User account";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [  ];
  };

# ----- [ PROGRAMS ] ------------------------------
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nano
    ];

  programs.firefox.enable = true;

# ----- [ FLAKES ] ------------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ----- [ STATE VERSION ] ------------------------------
  system.stateVersion = "25.11" ;

}
