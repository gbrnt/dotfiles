# Git aliases
alias gsts='git status'
alias gadd='git add -A'
alias gcmt='git commit -v'
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

# Get current temperature (Ryzen) [Broken]
alias temp="sensors | grep CPUTIN"

# Connect to ESP8266
espconn() {
    picocom -b 115200 $1
}

# Connect to Arduino on default serial port
alias arduino_serial='picocom -y n -b 9600 -f n -d 8 /dev/ttyACM0'

# Make tmux use 256colour
alias tmux="tmux -2"

# Stow aliases
alias dotfile="stow -t ~/"
# /usr/local/bin requires root privileges
alias dotscript="sudo stow -t /usr/local/bin/"

# Create hotspot (Ishmael specific)
alias hotspot="sudo create_ap -m nat wlp3s0f0u9 enp30s0 Ishmael mwahahahaha"

# Reboot into UEFI setup
alias reboot-uefi="systemctl reboot --firmware-setup"

# Play youtube video with certain MPV options
utub() {
    mpv --ytdl-format="bestvideo[height<=480]+bestaudio" "$1"
}
