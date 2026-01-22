{
  config, 
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.nff;
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

    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {
        logo = {
          width = 65;
          height = 35;
          source = "auto";
          padding = {
            top = 0;
            left = 0; 
            right = 2;
          };
        };
        display = {
          separator = ": ";
          color = { 
            keys = "blue"; 
            title = "red"; 
          };
        };
      };
      description = "Fastfetch settings.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.fastfetch];

    environment.etc."fastfetch/config.jsonc".text = ''
    // Generated file from nff.
    ${builtins.toJSON cfg.settings}  
    '';
  };
}
