{
  lib,
  ...
}:

let
  defaultValues = import ../default-values.nix;
in 
{
  options.programs.nff.settings = {

    logo.type = lib.mkOption {
      type = lib.types.str;
      default = defaultValues.logo.type;
      description = "Setting of the logo type.";
    };
    
    logo.width= lib.mkOption {
      type = lib.types.int;
      default = defaultValues.logo.width;
      description = "Logo width.";
    };
    
    logo.height = lib.mkOption {
      type = lib.types.int;
      default = defaultValues.logo.height;
      description = "Logo height.";
    };
    
    logo.source = lib.mkOption {
      type = lib.types.str;
      default = defaultValues.logo.source;
      description = "Logo source.";
    };
    
    logo.padding = {

      top = lib.mkOption {
        type = lib.types.int;
        default = defaultValues.logo.padding.top;
        description = "Setting of the logo type.";
      };
      
      left = lib.mkOption {
        type = lib.types.int;
        default = defaultValues.logo.padding.left;
        description = "Setting of the logo type.";
      };
      
      right = lib.mkOption {
        type = lib.types.int;
        default = defaultValues.logo.padding.right;
        description = "Setting of the logo type.";
      };
    };
  };
}
