{ config, pkgs, ... }: {
# ----- [ VMKit.nix ] ------------------------------
#If you plan on using this, read: https://wiki.nixos.org/wiki/Virt-manager
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    environment.systemPackages = with pkgs; [
  dnsmasq
];
    networking.firewall.trustedInterfaces = [ "virbr0" ];
}
