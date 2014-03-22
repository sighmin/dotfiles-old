# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"
# ZSH_THEME="blinks"
# ZSH_THEME="simon"
# ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# I'm considering extracting the aliases I actually use... and leaving the rest.
plugins=(git brew bundler postgres ruby zeus)

source $ZSH/oh-my-zsh.sh

#############################################
# User configuration
#############################################

export PATH="/usr/local/share/npm/bin":$PATH
export PATH="/usr/texbin":$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin":$PATH
export PATH="$HOME/.rbenv/bin":$PATH
export PATH="$HOME/.rbenv/shims":$PATH
#export PATH="$HOME/.pyenv/bin":$PATH
#export PATH="$HOME/.pyenv/shims":$PATH
export PATH="$HOME/.goenv/bin":$PATH
#export PATH="$HOME/.goenv/shims":$PATH
export PATH="/usr/local/heroku/bin":$PATH
export PATH="/usr/local/narwhal/bin":$PATH
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # export EDITOR='mvim'
fi

# Preferred key bindings (vi instead of emacs)
bindkey -v
# Kill the lag
export KEYTIMEOUT=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv and pyenv
eval "$(rbenv init -)"
#eval "$(pyenv init -)"
eval "$(goenv init -)"


### ALIASES ###
# be nice to windows users
alias dir='ls'
alias cls='clear'
# personal aliases
alias md='mkdir -p'
alias rd='rmdir'
alias l='ls -la'
alias la='ls -al'
alias ll='ls -l'
alias ls='ls -CFG'
alias lsa='ls -lah'
alias please='sudo'
alias pls='sudo'
alias touche='touch'
# dev aliases
alias b='bundle'
alias z='zeus'
alias zr='zeus rake'
alias zs='zeus server'
alias zc='zeus console'
alias zd='zeus dbconsole'
alias gblame='git blame'
alias gg='git add -A .; git commit -m'
alias rk='bundle exec rake'
# tmux aliases
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
# db aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# project aliases
alias mds='ssh simon@mds.mogulview.com'
# command aggregation aliases
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

### ENVIRONMENT ###
# rails devise default user for railsapps composer
export ADMIN_NAME="Admin Guy"
export ADMIN_EMAIL="admin@example.com"
export ADMIN_PASSWORD="password123"
# env variables
export NODE_PATH=/usr/local/lib/node
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GOPATH="$HOME/.goenv/bin"
export NARWHAL_ENGINE=jsc
export CAPP_BUILD=$HOME/.cappbuild
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

