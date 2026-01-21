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
      
      displaySeperator = lib.mkOption {
        type = lib.types.str;
        default = ": ";
        description = ''
          Seperator between keys and values.
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
        "width": "${toString cfg.logoWidth}",
        "height": "${toString cfg.logoHeight}",
        "padding": {
          "top": "${toString cfg.logoPaddingTop}",
          "left": "${toString cfg.logoPaddingLeft}",
          "right": "${toString cfg.logoPaddingRight}",
        }
      },
      "display": {
        "seperator": "${cfg.displaySeperator}",
        "color": {
          "keys": "${cfg.displayColorKeys}"
          "title": "${cfg.displayColorTitle}"
        },
      },
      "modules": [],
    }
    '';
  };
}
