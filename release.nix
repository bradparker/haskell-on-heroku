{ name
, nixpkgs ? import ./nix/nixpkgs.nix
}:
let
  inherit (nixpkgs)
    busybox
    callPackage
    dockerTools
    haskell
    lib;

  package = lib.pipe
    (callPackage ./. {})
    (with haskell.lib; [
      dontCheck
      justStaticExecutables
    ]);
in
  dockerTools.buildImage {
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
