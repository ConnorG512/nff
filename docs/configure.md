# Configuration:

> [!NOTE]
> Configuration options are not complete and will be added here as they have been finished. Nff is not currently in a particularly usable state.

For more configuration options see the [fastfetch configuration options](https://github.com/fastfetch-cli/fastfetch/wiki/Configuration).

## General

Enable the use of nff.<br>
**Type**: *bool*<br>
**Default**: *false*<br>
```
  programs.nff.enable; 

```

Enable the fastfetch wrapper.<br>
**Type**: *bool*<br>
**Default**: *true*<br>
```
  programs.nff.useWrapper; 

```
> [!IMPORTANT]
> If the wrapper is disabled, `fastfetch -c /etc/fastfetch/config.jsonc` would need to be called manually. Should be used for testing.
> Configuration file will still be generated even when disabled.

## Logo options: 

Logo type.<br>
**Type**: *string*<br>
**Default**: *"builtin"*<br>
```
programs.nff.settings.logo.type;

```

Logo width.<br>
**Type**: *int*<br>
**Default**: *30*<br>
```
programs.nff.settings.logo.width;

```
Logo height.<br>
**Type**: *int*<br>
**Default**: *15*<br>
```
programs.nff.settings.logo.height;

```
Logo source.<br>
**Type**: *string*<br>
**Default**: *"auto"*<br>
```
programs.nff.settings.logo.source;

```
Logo top padding.<br>
**Type**: *int*<br>
**Default**: *0*<br>
```
programs.nff.settings.logo.padding.top;

```
Logo left padding.<br>
**Type**: *int*<br>
**Default**: *0*<br>
```
programs.nff.settings.logo.padding.left;

```
Logo right padding.<br>
**Type**: *int*<br>
**Default**: *2*<br>
```
programs.nff.settings.logo.padding.right;

```

## Display options: 

Characters used as separator.<br>
**Type**: *string*<br>
**Default**: *": "*<br>
```
programs.nff.settings.display.separator;
```

Keys color.<br>
**Type**: *string*<br>
**Default**: *"blue"*<br>
```
programs.nff.settings.display.color.keys;
```

Title color.<br>
**Type**: *string*<br>
**Default**: *"red"*<br>
```
programs.nff.settings.display.color.title;
```

Align keys to width.<br>
**Type**: *int*<br>
**Default**: *12*<br>
```
programs.nff.settings.display.key.width;
```

Key Type.<br>
**Type**: *string*<br>
**Default**: *"none"*<br>
```
programs.nff.settings.display.key.type;
```

Percentage bar width.<br>
**Type**: *int*<br>
**Default**: *10*<br>
```
programs.nff.settings.display.bar.width;
```

Character type for elapsed.<br>
**Type**: *string*<br>
**Default**: *"■"*<br>
```
programs.nff.settings.display.bar.char.elapsed;
```

Character type for total.<br>
**Type**: *string*<br>
**Default**: *"none"*<br>
```
programs.nff.settings.display.bar.char.total;
```

Percent type.<br>
**Type**: *int*<br>
**Default**: *9*<br>
**Options**: *1 = number, 2 = bar, 3=both, 9 = colored number*<br>
```
programs.nff.settings.display.percent.type;
```

Percent "green" color.<br>
**Type**: *string*<br>
**Default**: *"green"*<br>
```
programs.nff.settings.display.percent.color.green;
```

Percent "yellow" color.<br>
**Type**: *string*<br>
**Default**: *"light_yellow"*<br>
```
programs.nff.settings.display.percent.color.yellow;
```

Percent "red" color.<br>
**Type**: *string*<br>
**Default**: *"light_red"*<br>
```
programs.nff.settings.display.percent.color.red;
```

## Modules

Module list.<br>
**Type**: *List of attributes*<br>
**Default**: *\[ "title" "os" "kernel" "memory" "cpu" "uptime"\]*<br>
```
programs.nff.settings.display.percent.color.red;
```
