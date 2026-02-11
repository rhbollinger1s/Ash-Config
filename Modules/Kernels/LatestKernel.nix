{ config, pkgs, ... }: {
# # ----- [ LatestKernel ] ------------------------------
    imports = [ ];
    boot.kernelPackages = pkgs.linuxPackages_latest;
    hardware.firmware = [ pkgs.linux-firmware ];
}
