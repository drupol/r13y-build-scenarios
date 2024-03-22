{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ { self, flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;

    perSystem = { config, self', inputs', pkgs, system, lib, ... }: {
      devShells.default = pkgs.mkShell {
        name = "r13y-build-scenarios";

        packages = [
          pkgs.gnumake
        ];
      };
    };

  };
}
