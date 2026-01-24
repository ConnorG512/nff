# Configuration:

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



