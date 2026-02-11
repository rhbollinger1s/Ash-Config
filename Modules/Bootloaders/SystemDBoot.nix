{ config, pkgs, ... }: {
# ----- [ SystemDBoot ] ------------------------------
    imports = [ ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
