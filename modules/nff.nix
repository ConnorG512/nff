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

    useWrapper = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Enable the fastfetch wrapper or to install the unwrapped package.
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
          key = {
            width = 12;
            type = "none";
          };
          bar = {
            width = 10;
            char = {
              elapsed = "■";
              total = "-";
            };
          };
          percent = {
            type = 9;
            color = {
              green = "green";
              yellow = "light_yellow";
              red = "light_red";
            };
          };
          modules = [ "title" "seperator" ];
        };
      };
      description = "Fastfetch settings.";
    };
  };

  config = lib.mkIf cfg.enable {
    
    environment.systemPackages = 
    if cfg.useWrapper then
    [
      /*
        Wrap fastfetch in a -c flag as configuration will be stored in /etc directory.
      */
      (pkgs.symlinkJoin {
        name = "fastfetch";
        buildInputs = [ pkgs.makeWrapper ];
        paths = [ pkgs.fastfetch ];
        postBuild = ''
          wrapProgram $out/bin/fastfetch \
            --append-flags "-c /etc/fastfetch/config.jsonc"
        '';
      })
    ]
    else
      [ pkgs.fastfetch ];

    environment.etc."fastfetch/config.jsonc".text = ''
    // Generated file from nff.
    ${builtins.toJSON cfg.settings}  
    '';
  };
}
