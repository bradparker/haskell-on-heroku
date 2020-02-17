let
  nixpkgs = import ./nixpkgs.nix {};
in
{ haskellPackages ? nixpkgs.haskellPackages, ... }:
  haskellPackages.callCabal2nix "haskell-on-heroku" ./. {}
