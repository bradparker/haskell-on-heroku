let
  nixpkgs = import ./nix/nixpkgs.nix;
in
{ haskellPackages ? nixpkgs.haskellPackages, ... }:
  haskellPackages.callCabal2nix "haskell-on-heroku" ./. {}
