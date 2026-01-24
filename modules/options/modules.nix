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
    modules = lib.mkOption {
      type = lib.types.listOf (lib.types.enum supportedModules);
      default = defaultValues.modules;
      description = "List of modules.";
    };
  };
}
