let
  nixpkgs = (import ./nix/nixpkgs.nix);
in
  { busybox ? nixpkgs.busybox
  , callPackage ? nixpkgs.callPackage
  , dockerTools ? nixpkgs.dockerTools
  , haskell ? nixpkgs.haskell
  , lib ? nixpkgs.lib
  , name
  , ...
  }:
  let
    package = lib.pipe (callPackage ./. {}) (with haskell.lib; [
      dontCheck
      disableSharedLibraries
      justStaticExecutables
    ]);
  in
    nixpkgs.dockerTools.buildImage {
      name = name;
      tag = "latest";
      contents = [
        busybox
        package
      ];
      config = {
        Cmd = ["/bin/${package.pname}"];
      };
    }
