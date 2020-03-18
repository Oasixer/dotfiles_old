# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/k/.oh-my-zsh"

ZSH_THEME="birame"
#ZSH_THEME=""

ENABLE_CORRECTION="true"

export EDITOR="nvim"
export BROWSER="google-chrome-stable"

export term="xterm-256color"

alias ll="ls -lh"
alias la="ls -lah"

#alias up="cd .."
#alias up2="cd ..; cd .."

alias vim="nvim"

alias cls="clear"
alias rl="source ~/.zshrc"

#max brightness
alias brm="cat /sys/class/backlight/intel_backlight/max_brightness"
alias br="/sys/class/backlight/intel_backlight"

#alias steal="yaourt -S"

#alias connect="nmcli device wifi connect"

#alias info="info --vi-keys"

# Enable colors and change prompt:
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#plugins=(git zsh-syntax-highlighting)
plugins=(git zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

#export PATH="$PATH:~/.cargo/bin"

# V1
# Change cursor shape for different vi modes.
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# V2
#terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
#
#function insert-mode () { echo "-- INSERT --" }
#function normal-mode () { echo "-- NORMAL --" }
#
#precmd () {
#    # yes, I actually like to have a new line, then some stuff and then 
#    # the input line
#    print -rP "
#[%D{%a, %d %b %Y, %H:%M:%S}] %n %{$fg[blue]%}%m%{$reset_color%}"
#
#    # this is required for initial prompt and a problem I had with Ctrl+C or
#    # Enter when in normal mode (a new line would come up in insert mode,
#    # but normal mode would be indicated)
#    PS1="%{$terminfo_down_sc$(insert-mode)$terminfo[rc]%}%~ $ "
#}
#function set-prompt () {
#    case ${KEYMAP} in
#      (vicmd)      VI_MODE="$(normal-mode)" ;;
#      (main|viins) VI_MODE="$(insert-mode)" ;;
#      (*)          VI_MODE="$(insert-mode)" ;;
#    esac
#    PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%~ $ "
#}
#
#function zle-line-init zle-keymap-select {
#    set-prompt
#    zle reset-prompt
#}
#preexec () { print -rn -- $terminfo[el]; }
#
#zle -N zle-line-init
#zle -N zle-keymap-select

#V3
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    printf "\033[2 q"
else
    printf "\033[6 q"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
printf "\033[6 q"
}
zle -N zle-line-init
