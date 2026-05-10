# j33p zsh config

Source-of-truth zsh and Powerlevel10k configuration shared across macOS and NixOS/Home Manager.

## Files

- `zshrc` -> `~/.zshrc`
- `zprofile` -> `~/.zprofile`
- `p10k.zsh` -> `~/.p10k.zsh`

## Local secrets and machine-specific settings

Do not commit secrets here. Put local machine-only exports in:

```text
~/.config/zsh/local.zsh
```

That file is intentionally outside this repo and should stay untracked. Yes, this is less exciting than leaking an API key. That is the point.

## Manual install

```bash
./install.sh
```

NIXOS consumes this repo through the Home Manager config in `j33pguy/nixos`.
