{
  config, 
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.nff;
  
  createPackage = import ./create-package.nix;
  finalPackage = createPackage{ inherit pkgs; isWrapped = cfg.useWrapper; };
in
{
  imports = [
    ./options/logo.nix
    ./options/display.nix
    ./options/modules.nix
    ./options/general.nix
  ];

  options.programs.nff = {
    settings = {};
  };

  config = lib.mkIf cfg.enable {
    
    environment.systemPackages = [ finalPackage ];
    
    environment.etc."fastfetch/config.jsonc".text = builtins.toJSON {
      logo = cfg.settings.logo;
      display = cfg.settings.display;
      modules = cfg.settings.modules;
    };
  };
}
