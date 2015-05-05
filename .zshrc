# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(cabal)

source $ZSH/oh-my-zsh.sh
#source /usr/local/share/chruby/chruby.sh

GHC_VERSION="7.10.1"
# GHC_VERSION="7.8.4"

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin
# PATH=$HOME/.cabal/bin:$PATH # Add Cabal to PATH
PATH=$PATH:~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/$GHC_VERSION/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools # Add Android SDK to path
PATH=$HOME/npm/bin:$PATH # Add npm to path
PATH=$PATH:/usr/local/heroku/bin  ### Added by the Heroku Toolbelt
PATH=$PATH:/opt/libreoffice4.4/program
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:~/fs/hs/elm/.cabal-sandbox/bin/

export SCALA_HOME=/home/jon/opt/scala-2.11.5
PATH=$PATH:$SCALA_HOME/bin

export GOPATH=/home/jon/opt/go
PATH=$PATH:$GOPATH/bin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

EDITOR='vi'
export EDITOR
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export _JAVA_AWT_WM_NONREPARENTING=1
# export AWT_TOOLKIT=MToolkit

alias xclip="xclip -selection c"
alias h="history"
alias v="vi"
alias rdesktop-ex="rdesktop ADDRESS -d DOMAIN -u USER -p - "
alias 7zap='7za a -tzip -p -mem=AES256'
alias 7zae='7za e'
alias fc-list-family="fc-list -f \"%{family}\n\" | sort | uniq"
alias nuget="mono ~/opt/nuget/NuGet.exe"
alias paket="mono ~/opt/paket/paket.exe"

# networking
alias nslt="netstat -tlnp"
alias lsoft="lsof -nPi tcp"
alias iptL="sudo iptables -L -v -n"
alias iptF="sudo iptables -F"
alias iptNL="sudo iptables -t nat -L -v -n"
alias iptNF="sudo iptables -t nat -F"

alias lock="i3lock -c 000000"
alias tmux="TERM=screen-256color-bce tmux"
alias -g gp='| grep -ie'
alias -g gpv='| grep -iev'

alias cl='git clone'
alias gaa='git add -A'
alias gb='git b'
alias gcb='git checkout -b'
alias gck='git checkout'
alias gcm='git cm'
alias ghard='git reset --hard'
alias gl='git lg'
alias gs='git status -s'

alias gn='git-number --column -s'
alias ga='git-number add'

grl () {git rev-list --ancestry-path --first-parent $@..HEAD}

alias bigdirs='du -sk * | sort -nr | head -10'
alias -s html=surf
# alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
# alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
# alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"

alias ch='google-chrome'
alias tl='t stream timeline'
alias ev='evince'
alias sa='sudo apt-get'
alias gi='ghci'
alias rg='runghc'

export BROWSER=google-chrome
export SSLKEYLOGFILE=~/.sslkey.log

g () { command gvim --remote-silent $@ 2> /dev/null || command gvim $@; }
xnview () { command setsid xnview $@ 2>&1 >/dev/null }
# sumatrapdf () { command wine /opt/sumatra-pdf/SumatraPDF.exe $@  2> /dev/null & }
# psg() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
# fname() { find . -iname "*$@*"; }


autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

setopt nocorrect
setopt nocorrectall
setopt autocd
setopt extendedglob

ranger-cd() {
  tempfile=$(mktemp)
  ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
  test -f "$tempfile" &&
  if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
    cd -- "$(cat "$tempfile")"
  fi
  rm -f -- "$tempfile"
}

zle -N ranger-cd
bindkey '^g' ranger-cd

export MARKPATH=$HOME/.marks
function j {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function m {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function um {
    rm -i $MARKPATH/$1
}
function ms {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _marks {
    reply=($(ls $MARKPATH))
}

function s {
    (surf `readlink -e $1` 2> /dev/null &)
}
function si {
    (surf `readlink -e index.html` 2> /dev/null &)
}

# function cabal_sandbox_info() {
#     cabal_files=(*.cabal(N))
#     if [ $#cabal_files -gt 0 ]; then
#         if [ -f cabal.sandbox.config ]; then
#             echo "%{$fg[green]%}sandboxed%{$reset_color%}"
#         fi
#     fi
# }
 
#RPROMPT="\$(cabal_sandbox_info) $RPROMPT"

compctl -K _marks j
compctl -K _marks um
if which ghc >/dev/null
then
	function hmap { ghc -e "interact ($*)";  }
	function hmapl { hmap  "unlines.($*).lines" ; }
	function hmapw { hmapl "map (unwords.($*).words)" ; }
fi	
#chruby 2.1.2

# start/source ssh-agent
export SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    # echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    # echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    # /usr/bin/ssh-add;
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else start_agent; fi
