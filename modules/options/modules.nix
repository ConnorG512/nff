{
  lib,
  ...
}:

let
  defaultValues = import ../default-values.nix;

  supportedModules = [
    "title"
    "separator"
    "os"
    "host"
    "bios"
    "bootmgr"
    "board"
    "chassis"
    "kernel"
    "initsystem"
    "uptime"
    "loadavg"
    "processes"
    "packages"
    "shell"
    "editor"
    "display"
    "brightness"
    "monitor"
    "lm"
    "de"
    "wm"
    "wmtheme"
    "theme"
    "icons"
    "font"
    "cursor"
    "wallpaper"
    "terminal"
    "terminalfont"
    "terminalsize"
    "terminaltheme"
    "cpu"
    "cpucache"
    "cpuusage"
    "gpu"
    "memory"
    "physicalmemory"
    "swap"
    "disk"
    "btrfs"
    "zpool"
    "battery"
    "poweradapter"
    "player"
    "media"
    "publicip"
    "localip"
    "dns"
    "wifi"
    "datetime"
    "locale"
    "vulkan"
    "opengl"
    "opencl"
    "users"
    "bluetooth"
    "bluetoothradio"
    "sound"
    "camera"
    "gamepad"
    "mouse"
    "keyboard"
    "weather"
    "netio"
    "diskio"
    "phsysicaldisk"
    "tpm"
    "version"
    "break"
    "colors"
  ];
in
{
  options.programs.nff.settings = {
    
    /*
      Modules in fastfetch can be a string on its own "cpu" or a braced of extra customised options.
      Both need to be supported whilst still keeping error checking. So need to check for an enum 
      of correct types as well as taken account the {} options.

      in {} options, the "id" parameter refers to the name in single "".
    */
    modules = lib.mkOption {
      type = lib.types.listOf (lib.types.either 
      (lib.types.enum supportedModules)
      (lib.types.submodule {
        freeformType = lib.types.arrtsOf lib.types.anything; # Custom options for specific id's.
        options.type = lib.mkOption {
          type = lib.types.enum(supportedModules ++ [ "custom" ]);
          description = "Custom options for a fastfetch module.";
        };
      }));
      default = defaultValues.modules;
      description = "List of modules.";
    };
  };
}
