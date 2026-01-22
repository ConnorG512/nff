{pkgs, isWrapped, ... }:

let
  # Wrap fastfetch in a -c flag as configuration will be stored in /etc directory.
  wrappedPackage = (pkgs.symlinkJoin {
    name = "fastfetch";
    buildInputs = [ pkgs.makeWrapper ];
    paths = [ pkgs.fastfetch ];
    postBuild = ''
      wrapProgram $out/bin/fastfetch \
        --append-flags "-c /etc/fastfetch/config.jsonc"
    '';
  });
  unwrappedPackage = [ pkgs.fastfetch ];

  selectedBinary = if isWrapped then 
    wrappedPackage
  else
    unwrappedPackage;
in
{
  environment.systemPackages = [ selectedBinary ];
}
