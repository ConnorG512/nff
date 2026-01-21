{
  description = "Fastfetch configuration framework flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  {
    nixosModules.fastfetch = import ./modules/fastfetch.nix;
  };
}
