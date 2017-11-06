# Path to your oh-my-zsh installation.
export ZSH="/Users/simonvandyk/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting dotenv)

eval "$(rbenv init -)"

# User configuration
# Allow Erlang history in iex with OTP 20
export ERL_AFLAGS="-kernel shell_history enabled"

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin":$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="./bin":$PATH
export PATH="/Users/simonvandyk/Code/miniconda3/bin:$PATH"

# Preferred key bindings (vi instead of emacs)
bindkey -v
bindkey "^R" history-incremental-search-backward
# Kill the lag
export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# bells suck
setopt nobeep

# don't error if a file cannot be found
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-NOMATCH
# https://robots.thoughtbot.com/how-to-use-arguments-in-a-rake-task
unsetopt nomatch

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


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
alias r='bin/rake'
alias ss='spring stop'
#alias gg='git add -A .; git commit -m'
alias tgpoc='bin/rails test && gpoc'
function t {
  rails t $@
}
function st {
  rails test:system $@
}
function pt {
  pytest -k $@
}

# language aliases
alias py='python'
alias cl='sbcl'
alias lisp='sbcl'

# project aliases
alias dotfiles='cd ~/Code/dotfiles/'
alias resetcamera='sudo killall VDCAssistant'

# tmux aliases
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tm='tmux show-messages'
alias tk='tmux kill-session -t'

# command aggregation aliases
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# .*rc file changes
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias trc="vim ~/.tmux.conf"
# tensorflow
alias atf="source ~/tensorflow/bin/activate"
alias dtf="deactivate"
alias gci="tmuxinator start gci"
alias ret="tmuxinator start ret"
alias nerve="tmuxinator start nerve"
alias migrate="rake db:migrate && rake db:test:prepare"

# Project aliases
alias p="ssh-add -K ~/.ssh/id_rsa && z p && tmux"

function git_churn {
  git log --all -M -C --name-only | grep -E '^(web|app|lib)/' | sort | uniq -c | sort | awk 'BEGIN {print "count,file"} {print $1 "," $2}' > out.csv | cat
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

# pull origin master
function glom {
  echo Pulling master
  git pull origin master
}

# pull origin develop
function glod {
  echo Pulling develop
  git pull origin develop
}

# create pull request into specified branch (develop if none specified)
function gpr {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | grep origin | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
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

# safe push to remote & create PR
function gpush {
  bin/rails t && \
    git push origin $(current_branch) -u && \
    gpr
}

# rake routes grep
function rr() {
  if [[ -n $1 ]]
  then
    ./rake routes | grep $1
  else
    ./rake routes
  fi
}

# file sharing
function shareit() {
  ruby -rwebrick -e "WEBrick::HTTPServer.new(:Port => 3096, :DocumentRoot => ENV['HOME']).start"
}

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# Z: fuzzy cd
. `brew --prefix`/etc/profile.d/z.sh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Share history across tmux panes
setopt histappend
setopt histverify
HISTCONTROL="ignoreboth"
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# added by travis gem
[ -f /Users/simonvandyk/.travis/travis.sh ] && source /Users/simonvandyk/.travis/travis.sh
