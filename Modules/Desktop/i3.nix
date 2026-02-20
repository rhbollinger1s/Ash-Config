{ config, pkgs, ... }: {
# ----- [ i3 ] ------------------------------
    imports = [ ];
    environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
     ];
    };
  };

  programs.i3lock.enable = true;
}
