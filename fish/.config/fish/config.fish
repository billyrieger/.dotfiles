set -x PATH $PATH ~/.cargo/bin
set -x FZF_DEFAULT_COMMAND 'fd --type f'
source ~/.asdf/asdf.fish

alias lsd 'lsd --group-dirs first'

starship init fish | source
