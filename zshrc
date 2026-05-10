# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/russseaman/.docker/completions $fpath)
autoload -Uz compinit
compinit -C


# End of Docker CLI completions
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

#export PATH="$HOME/.turso/env"

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
