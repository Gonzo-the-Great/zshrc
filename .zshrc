# Path Management
[[ ":$PATH:" != *":/mnt/linux/scripts:"* ]] && export PATH="$PATH:/mnt/linux/scripts"
[[ ":$PATH:" != *":/opt/homebrew/opt/mysql-client/bin:"* ]] && export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# SSH Agent
if [[ "$OSTYPE" == "darwin"* ]]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh
fi

# Default Editor
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export EDITOR="micro"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export EDITOR="code -w"
fi

# Aliases
alias conf='micro ~/.zshrc'
alias src='source ~/.zshrc'
alias fs='du -hs * | sort -h'
alias duh='du -c -h -d 1 | sort -h'
alias pip=pip3
alias python=python3
alias yp='yadm pull -f'
alias cdp='cd ..'
alias ignore='micro .gitignore'
alias sl="tail -n50 -f /var/log/syslog"
alias ipa='ifconfig | grep "inet " | grep -v 127 | sort -h'
alias ipa6='ifconfig | grep "inet6 " | sort -h'
alias pm='python manage.py'
alias activate="source \$(ls */bin/activate)"

# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gnzh"
plugins=(
  git
  ssh-agent
  copypath
  copyfile
  zsh-autosuggestions
  web-search
  jsontools
  sudo
  vscode
  history-substring-search
  docker
  docker-compose
)
if [[ "$OSTYPE" == "darwin"* ]]; then
  plugins+=(macports macos)
fi
source $ZSH/oh-my-zsh.sh

# Auto-Update Configuration
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# Case-Insensitive and Hyphen-Insensitive Completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Prompt Context
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo "%(!.%{%F{yellow}%}.)$USER@$(hostname)"
  fi
}
