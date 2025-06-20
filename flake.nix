{
  description = "NixOS flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self, nixpkgs, home-manager, nixvim, sops-nix, catppuccin, ... }@inputs: {
      nixosConfigurations = {
        mimo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./system/configuration.nix

            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [
                sops-nix.homeManagerModules.sops
                catppuccin.homeModules.catppuccin
              ];

              home-manager.users.thankod = import ./home/home.nix;
            }
            sops-nix.nixosModules.sops
          ];
        };
      };
    };
}
