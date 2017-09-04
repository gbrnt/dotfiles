# Git aliases
alias gsts='git status'
alias gadd='git add -A'
alias gcmt='git commit'
alias gpsh='git push'
alias gpll='git pull'
alias gmrg='git merge dev master'
alias glog='git log'

# ls aliases
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias lt='ls -t --color=auto'
alias cls='clear && ls'

# Misc aliases
alias uzbl="uzbl-tabbed"
alias please='sudo $(history -p !!)'
alias flightgear='fgfs --aircraft=c172p --airport=EGKK --enable-terrasync --httpd=8080'
alias q='exit'

# Emacs aliases
alias emax='emacsclient -t -c -a ""'
alias emacsc='emacsclient -c -a emacs'
alias spacemacs='emacsclient -c -a emacs'
alias emacskill='/usr/bin/emacsclient --eval "(kill-emacs)"'

# Pomodoro aliases
alias pomo='cd ~/Documents/Programs/Pomodoro/pomodoro-dev'
#alias pomodoro='cd ~/Documents/Programs/Pomodoro/pomodoro && clear'
# Doesnt pass -l argument properly
pomodoro() {
    cd ~/pomodoro/ &&
    ./pomodoro.py "$@"; }

# Mkdir and cd
md () { mkdir -p "$@" && cd "$@"; }

# Merge PDFs
pdfmerge () { gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf "$@"; }

# Get current temperature
alias temp='sensors | egrep "temp.+crit"'

# Connect to ESP8266
espconn() {
    picocom -b 115200 $1
}

# Make tmux use 256colour
alias tmux="tmux -2"
