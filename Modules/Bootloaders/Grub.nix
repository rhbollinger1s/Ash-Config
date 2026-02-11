{ config, pkgs, ... }: {
# ----- [ Grub ] ------------------------------
    imports = [ ];
    boot.loader.grub.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.device = "/dev/sda";
}
