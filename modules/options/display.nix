{
  lib,
  ...
}:

let
  defaultValues = import ../default-values.nix;
in
{
  options.programs.nff.settings = {

    display = lib.mkOption {
      default = { };
      description = "Display Configuration Options";
      type = lib.types.submodule {
        options = {
          separator = lib.mkOption {
            type = lib.types.str;
            default = defaultValues.display.separator;
            description = "Characters to use as separator.";
          };

          color = {
            keys = lib.mkOption {
              type = lib.types.str;
              default = defaultValues.display.color.keys;
              description = "Keys color.";
            };

            title = lib.mkOption {
              type = lib.types.str;
              default = defaultValues.display.color.title;
              description = "Title color.";
            };
          };

          key = {
            width = lib.mkOption {
              type = lib.types.int;
              default = defaultValues.display.key.width;
              description = "Key width.";
            };

            type = lib.mkOption {
              type = lib.types.str;
              default = defaultValues.display.key.type;
              description = "Key type.";
            };
          };

          bar = {
            width = lib.mkOption {
              type = lib.types.int;
              default = defaultValues.display.bar.width;
              description = "Bar width.";
            };

            char = {

              elapsed = lib.mkOption {
                type = lib.types.str;
                default = defaultValues.display.bar.char.elapsed;
                description = "Elapsed character.";
              };

              total = lib.mkOption {
                type = lib.types.str;
                default = defaultValues.display.bar.char.total;
                description = "Total character.";
              };
            };
          };

          percent = {

            type = lib.mkOption {
              type = lib.types.int;
              default = defaultValues.display.percent.type;
              description = "Percent Type.";
            };

            color = {

              green = lib.mkOption {
                type = lib.types.str;
                default = defaultValues.display.percent.color.green;
                description = "Green color.";
              };
              yellow = lib.mkOption {
                type = lib.types.str;
                default = defaultValues.display.percent.color.yellow;
                description = "Yellow color.";
              };
              red = lib.mkOption {
                type = lib.types.str;
                default = defaultValues.display.percent.color.red;
                description = "Red color.";
              };
            };
          };
        };
      };
    };
  };
}
