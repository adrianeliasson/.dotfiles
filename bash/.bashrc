# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
if [[ -f ~/.local/share/omarchy/default/bash/rc ]]; then
  source ~/.local/share/omarchy/default/bash/rc
else
  echo "Omarchy bash_rc file not found. Terminal may be lacking some functions (e.g. starship)"
fi

# To avoid accidentally overwriting existing files using the `echo "data" > file`  syntax
set -o noclobber
# Instead use following syntax:
# `echo "data" >| file`

# Omarchy Overwrites
alias cd="cd" # Do not overwrite the cd command, keep as-is, for zoxide use command "z"

# File system
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=never' # Never display icons next to file system items
fi


## Keeping these as a reminder that they exist
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias d='docker'
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }

source <(nsc completion bash)

alias lg='lazygit'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'

# Teach me to use type
_which_override() { # ignores following arguments that I might pass
    # TODO: For interactive shell this is fine,
    # but for scripts, `which` can be used to
    # get the path to binaries. This is a crude
    # solution, and maybe I will remove it soon.
    echo "use type instead: type $1"
}
alias which='_which_override'
alias pipvenv="python -m venv .venv;source .venv/bin/activate"

#
# Work specific overrides/imports
#
# The path should be defined in the .bash_profile file
[[ -f "${WORK_SPECIFIC_SCRIPTS_PATH}" ]] && source "${WORK_SPECIFIC_SCRIPTS_PATH}"
