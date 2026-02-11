{ config, pkgs, ... }: {
# ----- [ HyprlandNivida ] ------------------------------
    imports = [ ];
    programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
    };
    environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    };
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    environment.systemPackages = with pkgs; [
        waybar
        dunst
        libnotify
        hyprpaper
        wofi
        grim
        slupr
        wl-copy
  ];
}
