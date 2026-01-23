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

    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = import ./default-values.nix;
      description = "Fastfetch settings.";
    };
  };

  config = lib.mkIf cfg.enable {
    
    environment.systemPackages = [ finalPackage ];
    
    environment.etc."fastfetch/config.jsonc".text = ''
    // Generated file from nff.
    ${builtins.toJSON cfg.settings}  
    '';
  };
}
