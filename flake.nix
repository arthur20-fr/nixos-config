{

  description = "NixOS Config Flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # alias "nixpkgs/nixos-26.05"
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {

        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
            ./modules/system/boot/boot.nix
            ./modules/all-pkgs.nix
            ./modules/system/steam/default.nix
            #./modules/system/rstudio/default.nix
          ];
        };

        home-server = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/home-server/configuration.nix ];
        };
      };

      homeConfigurations = {

        arthur = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/laptop/home.nix ];
        };

      };
    };
}
