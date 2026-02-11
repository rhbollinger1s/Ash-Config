{ config, pkgs, ... }: {
# ----- [ PulseAudio ] ------------------------------
    imports = [ ];
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    nixpkgs.config.pulseaudio = true;
}
