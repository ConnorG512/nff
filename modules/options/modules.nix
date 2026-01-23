{
  lib,
  ...
}:

let
  defaultValues = import ../default-values.nix;
in
{
  options.programs.nff.settings = {
    modules = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = defaultValues.modules;
      description = "List of modules.";
    };
  };
}
