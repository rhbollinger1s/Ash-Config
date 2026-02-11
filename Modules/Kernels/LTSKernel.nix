{ config, pkgs, ... }: {
# ----- [ LTSKernel ] ------------------------------
    imports = [ ];
    boot.kernelPackages = pkgs.linuxPackages;
    hardware.firmware = [ pkgs.linux-firmware ];
}
