{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
    nostyleplease = {
      url = "github:Masellum/hugo-theme-nostyleplease";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nostyleplease,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "blog";

        meta = with pkgs.lib; {
          description = "Kristian's personal blog";
          platforms = platforms.all;
        };

        # Exclude themes and public folder from build sources
        src = builtins.filterSource (path: type:
          !(type
            == "directory"
            && (baseNameOf path == "themes" || baseNameOf path == "public")))
        ./.;

        # Link theme to themes folder and build
        buildPhase = ''
          mkdir -p themes
          ln -s ${nostyleplease} themes/nostyleplease
          ${pkgs.hugo}/bin/hugo --gc --minify
        '';

        installPhase = ''
          cp -r public/. $out
        '';
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [hugo];
        # Link theme to themes folder
        shellHook = ''
          mkdir -p themes
          unlink themes/nostyleplease
          ln -s ${nostyleplease} themes/nostyleplease
        '';
      };
    });
}
