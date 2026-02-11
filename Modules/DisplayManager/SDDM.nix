{ config, pkgs, ... }: {
# ----- [ SDDM ] ------------------------------
    imports = [ ];
    services.displayManager.sddm.enable = true;
}
