{ config, pkgs, ... }: {
# ----- [ Hyprland ] ------------------------------
    imports = [ ];
    programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
