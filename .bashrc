# PS1 Prompt
tty -s && export export PS1="\[\033[38;5;51m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;48m\][\[$(tput sgr0)\]\[\033[38;5;51m\]\h:\[$(tput sgr0)\]\[\033[38;5;220m\]\w\[$(tput sgr0)\]\[\033[38;5;48m\]]\[$(tput sgr0)\] \[$>
  
# Don't add duplicate lines or lines beginning with a space to the history
HISTCONTROL=ignoreboth
 
# Set history format to include timestamps
HISTTIMEFORMAT="%Y-%m-%d %T "
 
# Correct simple errors while using cd
shopt -s cdspell
 
# Command aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias cd..='cd ..'
alias cp='cp -iv'
alias chmod="chmod -c"
alias chmod="chmod -c"
alias df="df -h --exclude=squashfs"
alias diff='colordiff'
alias egrep='egrep --colour=auto'
alias e="vim -O "
alias E="vim -o "
alias extip='curl icanhazip.com'
alias grep='grep --color=auto'
alias l.=' ls -lhFa --time-style=long-iso --color=auto'
alias ll=' ls'
alias ls=' ls -lhF --time-style=long-iso --color=auto'
alias lsmount='mount |column -t'
alias mkdir='mkdir -pv'
alias ports='netstat -tulanp'
alias h='history'
alias j='jobs -l'
alias mv='mv -iv'
alias ssha='eval $(ssh-agent) && ssh-add'
alias svim='sudo vim'
alias watch='watch -d'
alias weather='curl wttr.in'
alias wget='wget -c'
 
## get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## List largest directories (aka "ducks")
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'
 
# Safetynets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
 
# reload bash config
alias reload="source ~/.bashrc"
 
# Manage packages easier
if [ -f /usr/bin/apt ]; then
  alias update='sudo apt update'
  alias upgrade='sudo apt update && sudo apt dist-upgrade'
  alias install='sudo apt install'
fi
 
if [ -f /usr/bin/pacman ]; then
  alias update='sudo pacman -Syyy'
  alias upgrade='sudo pacman -Syu'
  alias install='sudo pacman -S'
fi
 
## Functions
# Make a directory, then go there
md() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}
 
# "path" shows current path, one element per line.
# If an argument is supplied, grep for it.
path() {
    test -n "$1" && {
        echo $PATH | perl -p -e "s/:/\n/g;" | grep -i "$1"
    } || {
        echo $PATH | perl -p -e "s/:/\n/g;"
    }
}
 
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.tar.xz)    tar xvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
 
