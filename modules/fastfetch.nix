{
  config, 
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.fastfetch;
in
{
  options = {

    programs.fastfetch = {

      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Wether to enable the use of the fastfetch system information terminal application.
        '';
      };
      
      logo = {
        width = lib.mkOption {
          type = lib.types.int;
          default = 65;
          description = ''
            Width of the logo.
          '';
        };
        
        height = lib.mkOption {
          type = lib.types.int;
          default = 35;
          description = ''
            Height of the logo.
          '';
        };

        source = lib.mkOption {
          type = lib.types.str;
          default = "auto";
          description = ''
            Name of logo to display. use \"fastfetch --list-logos\" to see them all.
          '';
        };

        padding = {

          top = lib.mkOption {
            type = lib.types.int;
            default = 0;
            description = ''
              Logo top padding.
            '';
          };
          
          left = lib.mkOption {
            type = lib.types.int;
            default = 0;
            description = ''
              Logo left padding.
            '';
          };
          
          right = lib.mkOption {
            type = lib.types.int;
            default = 2;
            description = ''
              Logo right padding.
            '';
          };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.fastfetch];

    environment.etc."fastfetch/config.jsonc".text = ''
      // Generated file.

      "logo": {
        "type": "auto",
        "source": "${cfg.logo.source}",
        "width": "${cfg.logo.width}",
        "height": "${cfg.logo.height}",
        "padding": {
          "top": "${cfg.logo.padding.top}",
          "left": "${cfg.logo.padding.left}",
          "right": "${cfg.logo.padding.right}",
        },
      }
    '';
  };
}
