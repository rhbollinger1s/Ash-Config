{ config, pkgs, ... }: {
# ----- [ NividaOpenDriver ] ------------------------------
    imports = [ ];
    hardware.graphics.enable = true;
    hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.kernelParams = [ "nvidia-drm.fbdev=1" "nvidia-drm.modeset=1" ];
};
}
