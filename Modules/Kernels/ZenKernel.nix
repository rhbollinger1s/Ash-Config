{ config, pkgs, ... }: {
# ----- [ ZenKernel ] ------------------------------
    imports = [ ];
    boot.kernelPackages = pkgs.linuxPackages_zen;
    hardware.firmware = [ pkgs.linux-firmware ];
}
