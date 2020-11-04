{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "shell";

  nativeBuildInputs = [
  ];

  buildInputs = [
    # common
    which
    rlwrap
    less
    curl
    getopt

    # main
    nodejs
    yarn
    rsync
  ];

  LD_LIBRARY_PATH = stdenv.lib.makeLibraryPath [
    #openssl
  ];
}
