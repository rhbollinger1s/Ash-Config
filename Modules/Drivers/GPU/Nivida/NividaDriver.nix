{ config, pkgs, ... }: {
# ----- [ NividaDriver ] ------------------------------
    imports = [ ];
    hardware.graphics.enable = true;
    hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
};
}
