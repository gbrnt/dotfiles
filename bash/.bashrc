#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases

#PS1='[\u@\h \W]\$ ' # Original
#export PS1="[\u@\h: \w]\n\\$ \[$(tput sgr0)\]" # Colourless
export PS1="[\[$(tput sgr0)\]\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\h\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\n\\$ \[$(tput sgr0)\]"

# When I feel like using vim
export VISUAL="vim"
export EDITOR="vim"

# When I feel like using emacs
export ALTERNATE_EDITOR=""
#export EDITOR="emacsclient -t"
#export VISUAL="emacsclient -c -a emacs -t"

# Make sure terminal is 256color
if [ "$TERM" = "xterm" ]
then
    export TERM="xterm-256color"
fi

# Start tmux if not already in tmux and it's installed
#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

# Add ~/.local/bin and ~/.config/emacs/bin to PATH
export PATH=~/.local/bin:~/.config/emacs/bin:"$PATH"

# Set path to SSH agent so openssh can find it
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
