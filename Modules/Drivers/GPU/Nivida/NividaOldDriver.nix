{ config, pkgs, ... }: {
# ----- [ NividaOldDriver ] ------------------------------
    imports = [ ];
    hardware.graphics.enable = true;
    hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    open = false;
};
}
