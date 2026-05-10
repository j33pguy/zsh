# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k: explicit env override first, then common macOS/Linux paths.
if [[ -n "${P10K_THEME:-}" && -r "$P10K_THEME" ]]; then
  source "$P10K_THEME"
elif [[ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif [[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Docker Desktop completions, if present.
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
fi

autoload -Uz compinit
compinit -C

# Optional zsh plugins. Nix/Home Manager can provide explicit script paths via env.
if [[ -n "${ZSH_AUTOSUGGESTIONS_SCRIPT:-}" && -r "$ZSH_AUTOSUGGESTIONS_SCRIPT" ]]; then
  source "$ZSH_AUTOSUGGESTIONS_SCRIPT"
elif [[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -n "${ZSH_SYNTAX_HIGHLIGHTING_SCRIPT:-}" && -r "$ZSH_SYNTAX_HIGHLIGHTING_SCRIPT" ]]; then
  source "$ZSH_SYNTAX_HIGHLIGHTING_SCRIPT"
elif [[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Local, untracked machine-specific settings and secrets.
[[ -f "$HOME/.config/zsh/local.zsh" ]] && source "$HOME/.config/zsh/local.zsh"

# ppm wrapper — cd into project dir and open nvim after create/clone/open
ppm() {
    local chdir_file="$HOME/.config/ppm/.chdir"
    rm -f "$chdir_file"
    command ppm "$@"
    if [[ -f "$chdir_file" ]]; then
        local dir
        dir=$(<"$chdir_file")
        rm -f "$chdir_file"
        if [[ -d "$dir" ]]; then
            cd "$dir" && nvim .
        fi
    fi
}

PROMPT="${PROMPT}"$'\n'
