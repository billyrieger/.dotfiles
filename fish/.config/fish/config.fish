set -x PATH ~/.cargo/bin ~/.bin $PATH
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x MANPAGER 'nvim +Man!'
set -x MANWIDTH 999

source ~/.asdf/asdf.fish

#    --classify           # append helpful indicator to entries
#    --group-dirs first   # sort directories before files
#    --icon never         # don't require fancy patched fonts
alias lsd 'lsd --classify --group-dirs first --icon never'

starship init fish | source
