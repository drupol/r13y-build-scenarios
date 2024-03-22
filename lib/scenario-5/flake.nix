{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ { self, flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;

    perSystem = { config, self', inputs', pkgs, system, lib, ... }: {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "datetime";

        src = ./src;

        buildPhase = ''
          $CC datetime.c -o datetime
        '';

        installPhase = ''
          mkdir -p $out
          cp datetime $out/
        '';
      };
    };

  };
}
