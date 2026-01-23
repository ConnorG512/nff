{
  lib,
  ...
}:

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
  };
}
