Repo Organization:
* flake.nix
* Workstations
   * hyprlandDev/
      * Configuration.nix
   * server/
   * KDEPlasmaGaming/
      * Configuration.nix
* Modules/
   * Desktop/
      * KDEPlasma.nix
      * Gnome.nix
   * DisplayManager/
      * GDM.nix
      * Sddm.nix
      * LY.nix
   * Packages/
      * Apps/
         * Ventoy/
            * Ventoy.nix
            * VentoyQT.nix
            * VentoyGTK.nix
         * Steam.nix
      * Kits/
         * Gamekit.nix
         * Officekit.nix
         * Pythonkit.nix
         * Rustkit.nix
         * Dockerkit
         * Podmankit.nix
         * ModernCLIkit.nix
         * CoreCLIkit.nix
         * VMkit.nix
      * Fonts/
         * NerdFontKit.nix
   * Bootloaders/
      * Grub.nix
      * Systemd-boot.nix
   * Kernels/
      * LTSKernel.nix
      * ZenKernel.nix
      * LatestKernel.nix
   * Shells/
      * Bash.nix
      * Fish.nix
      * zhs.nix
* NixShells
   * Dev/
      * Rustshell/
         * Flake.nix
      * Pythonshell/
         * Flake.nix
   * Est/
      * Funshell/
         * Flake.nix
      * Pentestshell/
         * Flake.nix
* Drivers/
   * GPU/
      * Nivida/
         * NividaOpenDriver.nix
         * NividaDriver.nix
         * NividaDriverOlder.nix
         * Nouveau.nix
      * AMD
         * AMDDriver.nix
         * AMDLegacyDriver.nix
* Audio/
   * PulseAudio.nix
   * PipeWire.nix
* Services/
   * Bluetooth.nix
   * PowerProfile.nix
   * Fwupd.nix
   * Ollama.nix
   * CudaOllama.nix
   * Openwebui.nix
   * OpenSSH.nix
   * RTKit.nix
   * Fail2ban.nix
   * Cups.nix
* Est/
   * Firewall.nix
   * AutoUpdate.nix
   * SUIDwrappers.nix
   * XDGPortal.nix
   * ROCmHIPWorkaround.nix

Default Configuration File:

{ config, pkgs, ... }: {
# ----- [ IMPORTS ] ------------------------------
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
    ]; = true;

# ----- [ HOSTNAME ] ------------------------------
  networking.hostName = "ash-";

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
    description = “User account";
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
