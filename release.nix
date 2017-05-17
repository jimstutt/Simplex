let
  pkgs = import <nixpkgs> { };

in
  { 
    simplex = pkgs.haskellPackages.callPackage ./default.nix { };
  }
