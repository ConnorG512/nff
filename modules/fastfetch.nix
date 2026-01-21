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
      
      logoWidth = lib.mkOption {
        type = lib.types.int;
        default = 65;
        description = ''
          Width of the logo.
        '';
      };
      
      logoHeight = lib.mkOption {
        type = lib.types.int;
        default = 35;
        description = ''
          Height of the logo.
        '';
      };

      logoSource = lib.mkOption {
        type = lib.types.str;
        default = "auto";
        description = ''
          Name of logo to display. use \"fastfetch --list-logos\" to see them all.
        '';
      };

      logoPaddingTop = lib.mkOption {
        type = lib.types.int;
        default = 0;
        description = ''
          Logo top padding.
        '';
      };
      
      logoPaddingLeft = lib.mkOption {
        type = lib.types.int;
        default = 0;
        description = ''
          Logo left padding.
        '';
      };
      
      logoPaddingRight = lib.mkOption {
        type = lib.types.int;
        default = 2;
        description = ''
          Logo right padding.
        '';
      };
      
      displaySeparator = lib.mkOption {
        type = lib.types.str;
        default = ": ";
        description = ''
          Separator between keys and values.
        '';
      };
      
      displayColorKeys = lib.mkOption {
        type = lib.types.str;
        default = "blue";
        description = ''
          Key color.
        '';
      };
      
      displayColorTitle = lib.mkOption {
        type = lib.types.str;
        default = "red";
        description = ''
          Title color.
        '';
      };

      displayKeyWidth = lib.mkOption {
        type = lib.types.int;
        default = 12;
        description = ''
          Aligns keys to the given width.
        '';
      };

      displayKeyType = lib.mkOption {
        type = lib.types.str;
        default = "string";
        description = ''
          Key type.
        '';
      };
      
      displayBarWidth = lib.mkOption {
        type = lib.types.int;
        default = 10;
        description = ''
          With of percentage bar. 
        '';
      };

      displayBarCharElapsed = lib.mkOption {
        type = lib.types.str;
        default = "■";
        description = ''
          Character for the elapsed portion of the bar.
        '';
      };

      displayBarCharTotal = lib.mkOption {
        type = lib.types.str;
        default = "-";
        description = ''
          Character for the total portion of the bar.
        '';
      };

      displayPercentType = lib.mkOption {
        type = lib.types.int;
        default = 9;
        description = ''
          Title color.
        '';
      };

    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.fastfetch];

    environment.etc."fastfetch/config.jsonc".text = ''
    // Generated file.
    {
      "logo": {
        "type": "auto",
        "source": "${cfg.logoSource}",
        "width": ${toString cfg.logoWidth},
        "height": ${toString cfg.logoHeight},
        "padding": {
          "top": ${toString cfg.logoPaddingTop},
          "left": ${toString cfg.logoPaddingLeft},
          "right": ${toString cfg.logoPaddingRight}
        }
      },
      "display": {
        "separator": "${cfg.displaySeparator}",
        "color": {
          "keys": "${cfg.displayColorKeys}",
          "title": "${cfg.displayColorTitle}"
        },
        "key": {
          "width": ${toString cfg.displayKeyWidth},
          "type": "${cfg.displayKeyType}"
        },
        "bar": {
          "width": ${toString cfg.displayBarWidth},
          "char": {
            "elapsed": "${cfg.displayBarCharElapsed}",
            "total": "${cfg.displayBarCharTotal}"
          }
        },
        "percent": {
          "type": ${toString cfg.displayPercentType},
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
