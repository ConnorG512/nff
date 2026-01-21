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
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.fastfetch];
  };
}
