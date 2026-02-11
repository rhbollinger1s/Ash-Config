{ config, pkgs, ... }: {
# ----- [ GDM ] ------------------------------
    imports = [ ];
    services.displayManager.gdm.enable = true;
}
