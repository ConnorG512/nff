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
  options.programs.fastfetch = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Wether to enable the use of the fastfetch system information terminal application.
      '';
    };

    logo.width = lib.mkOption {
      type = lib.types.int;
      default = 65;
      description = ''
        Width of the logo.
      '';
    };
    
    logo.height = lib.mkOption {
      type = lib.types.int;
      default = 35;
      description = ''
        Height of the logo.
      '';
    };

    logo.source = lib.mkOption {
      type = lib.types.str;
      default = "auto";
      description = ''
        Name of logo to display. use \"fastfetch --list-logos\" to see them all.
      '';
    };

      
    logo.padding.top = lib.mkOption {
      type = lib.types.int;
      default = 0;
      description = ''
        Logo top padding.
      '';
    };

    logo.padding.left = lib.mkOption {
      type = lib.types.int;
      default = 0;
      description = ''
        Logo left padding.
      '';
    };
    
    logo.padding.right = lib.mkOption {
      type = lib.types.int;
      default = 2;
      description = ''
        Logo right padding.
      '';
    };

    display.separator = lib.mkOption {
      type = lib.types.str;
      default = ": ";
      description = ''
        Separator between keys and values.
      '';
    };
      
    display.color.keys = lib.mkOption {
      type = lib.types.str;
      default = "blue";
      description = ''
        Key color.
      '';
    };
    
    display.color.title = lib.mkOption {
      type = lib.types.str;
      default = "red";
      description = ''
        Title color.
      '';
    };

    display.key.width = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = ''
        Aligns keys to the given width.
      '';
    };

    display.key.type = lib.mkOption {
      type = lib.types.str;
      default = "string";
      description = ''
        Key type.
      '';
    };

    display.bar.width = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = ''
        With of percentage bar. 
      '';
    };

    display.bar.charElapsed = lib.mkOption {
      type = lib.types.str;
      default = "■";
      description = ''
        Character for the elapsed portion of the bar.
      '';
    };

    display.bar.charTotal = lib.mkOption {
      type = lib.types.str;
      default = "-";
      description = ''
        Character for the total portion of the bar.
      '';
    };
    
    display.percentType = lib.mkOption {
      type = lib.types.int;
      default = 9;
      description = ''
        Title color.
      '';
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
