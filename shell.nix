{ nixpkgs ? import ./nix/nixpkgs.nix }:
  let
    package = nixpkgs.callPackage ./. {};
    tools = with nixpkgs; [
      cabal-install
    ];
  in
    nixpkgs.stdenv.mkDerivation
      (package.env.drvAttrs // {
        buildInputs = tools;
      })
