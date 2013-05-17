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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
#
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

EDITOR='vi'
export EDITOR

alias xclip="xclip -selection c"
alias h="history"
alias v="vi"

alias fc-list-family="fc-list -f \"%{family}\n\" | sort | uniq"

# networking
alias nslt="netstat -tlnp"
alias lsoft="lsof -nPi tcp"
alias iptL="sudo iptables -L -v -n"
alias iptNL="sudo iptables -t nat -L -v -n"
alias iptNF="sudo iptables -t nat -F"

alias lock="i3lock -c 000000"
alias -g gp='| grep -i'

alias -s html=chromium-browser

# g () { command gvim --remote-silent $@ 2> /dev/null || command gvim $@; }
# xnview () { command xnview $@  2> /dev/null & }
# sumatrapdf () { command wine /opt/sumatra-pdf/SumatraPDF.exe $@  2> /dev/null & }
# psg() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
# fname() { find . -iname "*$@*"; }

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools # Add Android SDK to path
