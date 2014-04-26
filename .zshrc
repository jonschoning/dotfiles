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
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(cabal)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=$HOME/.cabal/bin:$PATH # Add Cabal to PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/opt/chrome-linux" ] ; then
    PATH="$HOME/opt/chrome-linux:$PATH"
fi

if [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

EDITOR='vi'
export EDITOR
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_25
export _JAVA_AWT_WM_NONREPARENTING=1
# export AWT_TOOLKIT=MToolkit
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome_sandbox

alias xclip="xclip -selection c"
alias h="history"
alias v="vi"

alias fc-list-family="fc-list -f \"%{family}\n\" | sort | uniq"

# networking
alias nslt="netstat -tlnp"
alias lsoft="lsof -nPi tcp"
alias iptL="sudo iptables -L -v -n"
alias iptF="sudo iptables -F"
alias iptNL="sudo iptables -t nat -L -v -n"
alias iptNF="sudo iptables -t nat -F"

alias lock="i3lock -c 000000"
alias tmux="TERM=screen-256color-bce tmux"
alias -g gp='| grep -i'

alias gn='git-number --column -s'
alias ga='git-number add'
alias bigdirs='du -sk * | sort -nr | head -10'
alias -s html=chrome
alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
export BROWSER=chrome

# g () { command gvim --remote-silent $@ 2> /dev/null || command gvim $@; }
# xnview () { command xnview $@  2> /dev/null & }
# sumatrapdf () { command wine /opt/sumatra-pdf/SumatraPDF.exe $@  2> /dev/null & }
# psg() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
# fname() { find . -iname "*$@*"; }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools # Add Android SDK to path

PATH=$PATH:~/.cabal/bin # Add cabal to path

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
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _marks {
    reply=($(ls $MARKPATH))
}

function cabal_sandbox_info() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            echo "%{$fg[green]%}sandboxed%{$reset_color%}"
        fi
    fi
}
 
RPROMPT="\$(cabal_sandbox_info) $RPROMPT"

compctl -K _marks jump
compctl -K _marks unmark

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
