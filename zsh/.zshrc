export FZF_DEFAULT_COMMAND="fd --type f"
export N_PREFIX="$HOME/.n"
export PYENV_ROOT="$HOME/.pyenv"
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$N_PREFIX/bin"
export PATH="$PATH:$PYENV_ROOT/bin"

# append helpful indicator to entries
# sort directories before files
# don't require fancy patched fonts
alias lsd="lsd --classify --group-dirs first --icon never"

fpath+=~/.zfunc

source "$ZSH/oh-my-zsh.sh"

[[ $+commands[pyenv] -eq 1 ]] && eval "$(pyenv init -)"

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

eval "$(starship init zsh)"
