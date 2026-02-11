{
  description = "NixOS config flake for Ash-Config";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-stable, home-manager, ... }@inputs: {

    nixosConfigurations.ash-Basic = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        ./Hosts/TemplateHosts/Basic/configuration.nix
      ];
      specialArgs = { inherit nixpkgs-unstable home-manager; };
    };

    nixosConfigurations.ash-Server = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        ./Hosts/TemplateHosts/Server/configuration.nix
      ];
      specialArgs = { inherit nixpkgs-stable home-manager; };
    };

    nixosConfigurations.ash-KDEDesktop = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        ./Hosts/TemplateHosts/Desktop/KDEPlasmaDesktop/configuration.nix
      ];
      specialArgs = { inherit nixpkgs-stable home-manager; };
    };

    nixosConfigurations.ash-HyprlandDesktop = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        ./Hosts/TemplateHosts/Desktop/HyprlandDesktop/configuration.nix
      ];
      specialArgs = { inherit nixpkgs-unstable home-manager; };
    };

    nixosConfigurations.JetBlack = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        ./Hosts/Rhbollinger1sHosts/Desktop/configuration.nix
      ];
      specialArgs = { inherit nixpkgs-unstable home-manager; };
    };

    # Boilerplate for adding new hosts
    # nixosConfigurations.HOSTNAME = nixpkgs-unstable.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     home-manager.nixosModules.default
    #     ./hosts/PATH/TO/YOUR/HOST/configuration.nix
    #   ];
    #   specialArgs = { inherit nixpkgs-unstable home-manager; };
    # };
  };
}
