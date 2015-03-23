# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="simon"
# ZSH_THEME="doubleend"
# ZSH_THEME="blinks"
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
COMPLETION_WAITING_DOTS="true"

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
plugins=(git brew bundler postgres mysql ruby zeus vi-mode wd colored-man emoji-clock nyan)

source $ZSH/oh-my-zsh.sh

#############################################
### User configuration

export PATH="/usr/local/share/npm/bin":$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin":$PATH
export PATH="$HOME/.rbenv/bin":$PATH
export PATH="$HOME/.rbenv/shims":$PATH
export PATH="$HOME/.pyenv/bin":$PATH
export PATH="$HOME/.pyenv/shims":$PATH
export PATH="/usr/local/heroku/bin":$PATH
export PATH="/usr/local/narwhal/bin":$PATH
export MANPATH="/usr/local/man:$MANPATH"
export PATH="/Users/simon/Develop/pebble/PebbleSDK-2.4.1/bin:$PATH"
export PATH="./bin":$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # export EDITOR='mvim'
fi

# Preferred key bindings (vi instead of emacs)
bindkey -v
bindkey "^R" history-incremental-search-backward
# Kill the lag
export KEYTIMEOUT=1

# Remove beep from autocomplete
setopt no_beep
# cd into directory if command is the same as a directory name
setopt auto_cd

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv and pyenv
eval "$(rbenv init -)"
eval "$(pyenv init -)"


######################################
### ALIASES

# be nice to windows users
alias dir='ls'
alias c='clear'
alias cls='clear'
# personal aliases
alias md='mkdir -p'
alias rd='rmdir'
alias l='ls -la'
alias la='ls -al'
alias ll='ls -l'
alias ls='ls -CFG'
alias lsa='ls -lah'
alias pls='sudo'
alias please='sudo'
alias touche='touch'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# dev aliases
alias v='vim'
alias b='bundle'
alias gg='git add -A .; git commit -m'
alias sync='git pull && git push'
alias gf='git fetch'
alias rk='bundle exec rake'
alias rb='bundle exec ruby'
alias rt='bundle exec rspec'
alias rg='bundle exec rake routes | grep'

# language aliases
alias py='python'
alias cl='sbcl'
alias lisp='sbcl'

# project aliases
alias mds='cd ~/Develop/work/45/ereads/MDS/'
alias fp='cd ~/Develop/work/45/fenixpro/app/'
alias anz='cd ~/Develop/work/45/anz/anz-merchant-portal/'
alias anzbox='ssh simon@202.167.246.11'
alias oregano='cd ~/Develop/projects/rebel-coders/oregano/oregano-prototype/'
alias pair='export PAIRING=1'
alias til='cd ~/Develop/work/45/happy/til/'
alias happy='cd ~/Develop/work/45/happy/'
alias dotfiles='cd ~/Develop/dotfiles/'

# tmux aliases
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tm='tmux show-messages'
alias tk='tmux kill-session -t'

# ereadz aliases
alias precompile='bundle exec rake assets:clean && bundle exec rake assets:precompile'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate'
alias sunspot='sudo killall java && bundle exec rake sunspot:solr:start RAILS_ENV=test; bundle exec rake sunspot:solr:start RAILS_ENV=development'

# command aggregation aliases
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# .*rc file changes
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias trc="vim ~/.tmux.conf"
alias nodeh="node --harmony"

# betty - siri for command line
alias betty="~/.betty/main.rb"

alias delswp="find . | grep .swp | xargs rm"
alias delds="find . | grep .DS_Store | xargs rm"
alias eclock="emoji-clock"
#alias coursera="coursera -n --"

function coursera {
  /usr/local/bin/coursera -n -- $@
}

######################################
### Custom Shell Features

# C-z to close and open vim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# open github for current repo
function gh {
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  echo Opening Github for $repo

  open "https://github.com/$repo"
}

# push origin current_branch
function gpoc {
  echo Pushing $(current_branch)
  git push origin $(current_branch)
}

# pull origin current_branch
function gloc {
  echo Pulling $(current_branch)
  git pull origin $(current_branch)
}

# fetch origin current_branch
function gfoc {
echo Fetching origin/$(current_branch)
  git fetch origin $(current_branch)
}

# merge origin current_branch
function gmoc {
echo Merging origin/$(current_branch) into $(current_branch)
  git merge origin/$(current_branch)
}

# create pull request into specified branch (develop if none specified)
function gpr {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  branch=""
  if [ $1 ]; then
    branch="$1...$(current_branch)"
  else
    branch="develop...$(current_branch)"
  fi

  open "https://github.com/$repo/compare/$branch?expand=1"
}

# list pull requests for repo
function gprl {
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  echo Opening list of pull requests for $repo
  open "https://github.com/$repo/pulls"
}

function service {
  if [ $1 ]; then
    case $1 in
      mysql)
        case $2 in
          start)
            mysql.server start
            ;;
          stop)
            mysql.server stop
            ;;
          *)
            echo "Command $2 not supported for service $1"
            exit 1
            ;;
        esac
        ;;
      postgres)
        case $2 in
          start)
            pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
            ;;
          stop)
            pg_ctl -D /usr/local/var/postgres stop -s -m fast
            ;;
          *)
            echo "Command $2 not supported for service $1"
            exit 1
            ;;
        esac
        ;;
      redis)
        case $2 in
          start)
            redis-server /usr/local/etc/redis.conf
            ;;
          *)
            echo "Command $2 not supported for service $1"
            exit 1
            ;;
        esac
        ;;
      *)
        echo "Service $1 not supported"
        exit 1
        ;;
    esac
  else
    echo "Usage: $0 SERVICE_NAME [start|stop|restart]"
  fi
}

function sync_dotfiles {
  cp ~/.vimrc ~/Develop/dotfiles/
  cp ~/.tmux.conf ~/Develop/dotfiles/
  cp ~/.zshrc ~/Develop/dotfiles/
  cp ~/.gitconfig ~/Develop/dotfiles/
  cp ~/.gitignore ~/Develop/dotfiles/
  cp ~/.gitignore_global ~/Develop/dotfiles/
  cp -R ~/.tmuxinator ~/Develop/dotfiles/
}

######################################
### ENVIRONMENT VARIABLES

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

# fish like shell highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
