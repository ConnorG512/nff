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

    fastfetch.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Wether to enable the use of the fastfetch system information terminal application.
      '';
    };

    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.any;
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
    // Generated file.
    {
      "logo": {
        "type": "auto",
        "source": "${cfg.logo.source}",
        "width": ${toString cfg.logo.width},
        "height": ${toString cfg.logo.height},
        "padding": {
          "top": ${toString cfg.logo.padding.top},
          "left": ${toString cfg.logo.padding.left},
          "right": ${toString cfg.logo.padding.right}
        }
      },
      "display": {
        "separator": "${cfg.display.separator}",
        "color": {
          "keys": "${cfg.display.color.keys}",
          "title": "${cfg.display.color.title}"
        },
        "key": {
          "width": ${toString cfg.display.key.width},
          "type": "${cfg.displayKeyType}"
        },
        "bar": {
          "width": ${toString cfg.display.bar.width},
          "char": {
            "elapsed": "${cfg.display.bar.charElapsed}",
            "total": "${cfg.display.bar.charTotal}"
          }
        },
        "percent": {
          "type": ${toString cfg.display.percentType},
          "color": {
            "green": "green",
            "yellow": "light_yellow",
            "red": "light_red"
          }
        }
      },
      "modules": []
    }
    '';
  };
}
