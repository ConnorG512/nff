# Configuration:

> [!NOTE]
> Configuration may not be complete and if missing will be added over time. Currently, display, logo as well as modules are supported.

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



