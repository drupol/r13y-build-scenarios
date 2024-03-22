{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ { self, flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;

    perSystem = { config, self', inputs', pkgs, system, lib, ... }: {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "typst-hello-world";

        src = ./src;

        nativeBuildInputs = [ pkgs.typst ];

        buildPhase = ''
          typst compile hello-world.typst hello-world.pdf
        '';

        installPhase = ''
          cp hello-world.pdf $out
        '';
      };
    };
  };
}
