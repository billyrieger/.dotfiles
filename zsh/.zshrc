export N_PREFIX="$HOME/.n"
export PYENV_ROOT="$HOME/.pyenv"
export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$N_PREFIX/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

# append helpful indicator to entries
# sort directories before files
# don't require fancy patched fonts
alias lsd="lsd --classify --group-dirs first --icon never"

source "$ZSH/oh-my-zsh.sh"

eval "$(starship init zsh)"
