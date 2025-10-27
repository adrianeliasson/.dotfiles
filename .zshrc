HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '/home/adriane/.zshrc'
autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git) # maybe not needed

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source "$ZSH/oh-my-zsh.sh"

#######################
# Adrian personal edits
#######################

bindkey -s ^f "~/sessionizer\n"

# Autocompletions
source <(fzf --zsh)
source <(kubectl completion zsh)
source <(zoxide init --cmd z zsh)
source <(starship init zsh)
source <(nsc completion zsh)

# inits
source /usr/share/nvm/init-nvm.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# In order to open oath/plejdvpn in the correct browser
_browser="google-chrome-stable"
export BROWSER="$_browser"
export DEFAULT_BROWSER="$_browser"

alias lg="lazygit"
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
# Teach me to use type
_which_override() { # ignores following arguments that I might pass
    echo "use type instead: type $1"
}
alias which='_which_override'
alias pipvenv="python -m venv .venv;source .venv/bin/activate"

# PATH
export PATH=$PATH:/home/adriane/.kubescape/bin


#######################
# Plejd specific edits
#######################

alias bcomp="bcompare" # Required in nats-accounts for running certain scripts that run bcomp instead of bcompare
alias awsauth="plsh-aws-auth"
alias plejdvpn="sudo whoami && xdg-open \"https://vpn.plejd.site:443/remote/saml/start?redirect=1\" && sudo openfortivpn vpn.plejd.site:443 --use-resolvconf=1 --trusted-cert ${plejd_vpn_trusted_cert} --saml-login" # Cert defined in zshenv

# PLSH-BEGIN source to install folder, Please do not remove this!
[ -d "/home/adriane/.config/plejd/plejd_shell/source.d" ] && for f in /home/adriane/.config/plejd/plejd_shell/source.d/*; do source $f; done
# PATH=/home/adriane/.config/plejd/plejd_shell/pkg/:${PATH}
# PLSH-END, do not remove this marker

alias iac_dev="(grt && ./build.sh -p plejd-dev-admin -w development -r eu-west-1)"
alias iac_stage="(grt && ./build.sh -p plejd-stage-admin -w staging -r eu-west-1)"
alias iac_stage="(grt && ./build.sh -p plejd-management-admin -w production -r eu-west-1)"
alias k="kubectl"
alias nsc="XDG_CONFIG_HOME=. XDG_DATA_HOME=. /usr/bin/nsc"

# nsc aliases
# alias ndo="nsc describe operator"
# alias nda="nsc describe account"
# alias ndu="nsc describe user"
# alias nlk="nsc list keys"
