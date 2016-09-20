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
plugins=(colorize colored-man-pages rsync)

source $ZSH/oh-my-zsh.sh
#source /usr/local/share/chruby/chruby.sh

GHC_VERSION="8.0.1"
GHCBIN7="/home/jon/.stack/programs/x86_64-linux/ghc-7.10.3/bin"

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin
# PATH=$HOME/.cabal/bin:$PATH # Add Cabal to PATH
PATH=$HOME/.local/bin:$PATH: # STACKAGE BIN DIR
PATH=$PATH:~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/$GHC_VERSION/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin
PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools # Add Android SDK to path
PATH=$HOME/npm/bin:$PATH # Add npm to path
PATH=:$PATH # Add npm to path
PATH=$PATH:/usr/local/heroku/bin  ### Added by the Heroku Toolbelt
PATH=$PATH:/opt/libreoffice5.1/program
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:~/opt/fstar/bin/
PATH=$PATH:~/opt/rebar3/

PATH=$PATH:/home/jon/opt/elm/Elm-Platform/master/.cabal-sandbox/bin
export ELM_HOME=/home/jon/opt/elm/Elm-Platform/master/.cabal-sandbox/share
                  
PATH=$PATH:/home/jon/opt/elm/Elm-Platform/master/.cabal-sandbox/bin
export ELM_HOME=/home/jon/opt/elm/Elm-Platform/master/.cabal-sandbox/share

export SCALA_HOME=/home/jon/opt/scala-2.11.7
PATH=$PATH:$SCALA_HOME/bin

export GOPATH=/home/jon/opt/go
PATH=$PATH:$GOPATH/bin

source /home/jon/.nvm/nvm.sh
# source /home/jon/fs/git/torch/install/bin/torch-activate
#

STOCKFIGHTER_API_KEY=$(</home/jon/.stockfighter)
export STOCKFIGHTER_API_KEY=$STOCKFIGHTER_API_KEY

export XDG_CONFIG_HOME=/home/jon/.config
# Cuda 7.5
PATH=$PATH:/usr/local/cuda-7.5/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

EDITOR='nvim'
export EDITOR
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export _JAVA_AWT_WM_NONREPARENTING=1
# export AWT_TOOLKIT=MToolkit

alias xclip="xclip -selection c"
alias h="history"
alias v="nvim"
alias nv="nvim"
alias rdesktop-ex="rdesktop ADDRESS -d DOMAIN -u USER -p - "
alias 7zap='7za a -tzip -p -mem=AES256'
alias 7zae='7za e'
alias fc-list-family="fc-list -f \"%{family}\n\" | sort | uniq"
alias nuget="mono ~/opt/nuget/NuGet.exe"
alias paket="mono ~/opt/paket/paket.exe"

# networking
alias nslt="netstat -tlnp"
alias lsoft="lsof -nPi tcp"
alias iptL="sudo iptables -nvL"
alias iptF="sudo iptables -F"
alias iptNL="sudo iptables -t nat -L -v -n"
alias iptNF="sudo iptables -t nat -F"

# alias lock="i3lock -c 000000"
alias lock="gnome-screensaver-command -l"
alias xlock="xscreensaver-command -lock"

alias tmux="TERM=screen-256color-bce tmux"
alias -g gp='|& grep -ie'
alias -g gpv='|& grep -iev'

alias cl='git clone'
alias cl1='git clone --depth=1'
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
alias clojure='java -cp ~/opt/clojure-1.8.0/clojure-1.8.0.jar clojure.main'

grl () {git rev-list --ancestry-path --first-parent $@..HEAD}

alias bigdirs='du -sk * | sort -nr | head -10'
alias -s html=surf
# alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
# alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
# alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"

alias ch='google-chrome'
alias tl='t stream timeline'
alias ev='evince'
alias sa='sudo apt-get -o Acquire::ForceIPv4=true '
alias ccat='pygmentize -O bg=dark'
alias gimp='gimp -c'
alias R='R -q --no-save'
alias git=hub
alias ixio="curl -F 'f:1=<-' ix.io"

alias ips="ip -o a | cut -d ' ' -f2,7"

export BROWSER=google-chrome
export SSLKEYLOGFILE=~/.sslkey.log

g () { command gvim --remote-silent $@ 2> /dev/null || command gvim $@; }
xnview () { command setsid xnview $@ 2>&1 >/dev/null }
dark () { GTK_THEME=Adwaita:dark $@ }
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
    (setsid surf `readlink -e $1` 1>/dev/null 2>/dev/null)
}
function si {
    (setsid surf `readlink -e index.html` 1>/dev/null 2>/dev/null)
}
# function aria2c0 {(
#     aria2c --seed-time=0 --max-overall-upload-limit=10K "$1";
#     notify-send -a aria2c "aria2c: Completed" "$1"
# )}

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
function  eg(){
    MAN_KEEP_FORMATTING=1 man "$@" 2>/dev/null \
        | sed --quiet --expression='/^E\(\x08.\)X\(\x08.\)\?A\(\x08.\)\?M\(\x08.\)\?P\(\x08.\)\?L\(\x08.\)\?E/{:a;p;n;/^[^ ]/q;ba}'
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else start_agent; fi

encodeURIComponent() {
  node -p "encodeURIComponent('${1//\'/\\\'}')"
}

# OPAM configuration
. /home/jon/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export DOTNET_CLI_TELEMETRY_OPTOUT=1

. <(azure --completion)
