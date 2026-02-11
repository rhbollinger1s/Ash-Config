{ config, pkgs, ... }: {
# ----- [ Gnome ] ------------------------------
    imports = [ ];
    services.desktopManager.gnome.enable = true;
}
