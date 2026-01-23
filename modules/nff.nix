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
  ];

  options.programs.nff = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable the use of the fastfetch system information terminal application.
      '';
    };

    useWrapper = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Enable the fastfetch wrapper or to install the unwrapped package.
      '';
    };

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
