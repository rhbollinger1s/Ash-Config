{ config, pkgs, ... }: {
# ----- [ DevKit ] ------------------------------
    imports = [ ];
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      kdePackages.kate
      git
      tmux
      ripgrep
      curl
      wget
      neovim
      gcc
      python3
      podman
  ];
}
