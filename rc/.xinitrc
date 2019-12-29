[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
setxkbmap -option caps:escape
exec i3
