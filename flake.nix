{

  description = "NixOS Config Flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # alias "nixpkgs/nixos-26.05"

  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {

      laptop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/laptop/configuration.nix 
          ./common/boot/boot.nix
        ];
      };

      home-server = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/home-server/configuration.nix ];
      };
    };
  };
}
