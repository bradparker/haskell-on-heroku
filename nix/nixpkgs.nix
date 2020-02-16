let
  nixpkgs-source = builtins.fetchTarball {
    url = https://releases.nixos.org/nixos/unstable/nixos-20.03pre212208.8130f3c1c2b/nixexprs.tar.xz;
  };
in
  import nixpkgs-source {}
