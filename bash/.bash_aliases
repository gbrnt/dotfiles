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
alias please='sudo $(history -p !!)'
alias q='exit'

# Emacs aliases
alias emax='emacsclient -t -c -a ""'
alias emacsc='emacsclient -c -a emacs'
alias spacemacs='emacsclient -c -a emacs'
alias emacskill='/usr/bin/emacsclient --eval "(kill-emacs)"'

# Mkdir and cd
md () { mkdir -p "$@" && cd "$@"; }

# Merge PDFs
pdfmerge () { gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf "$@"; }

# Make tmux use 256colour
alias tmux="tmux -2"

# Stow aliases
alias dotfile="stow -t ~/"
# /usr/local/bin requires root privileges
alias dotscript="sudo stow -t /usr/local/bin/"

# Reboot into UEFI setup
alias reboot-uefi="systemctl reboot --firmware-setup"

# Play youtube video with certain MPV options
utub() {
    mpv --ytdl-format="bestvideo[height<=480]+bestaudio" "$1"
}
