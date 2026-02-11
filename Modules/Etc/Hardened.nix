{ config, pkgs, ... }: {
# ----- [ Hardened ] ------------------------------
    imports = [ ];
    security.hardened.enable = true;
}
