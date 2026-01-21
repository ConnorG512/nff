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
      
      logo-source = lib.mkOption {
        type = lib.types.str;
        default = "auto";
        description = ''
          Name of logo to display. use \"fastfetch --list-logos\" to see them all.
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.fastfetch];
  };
}
