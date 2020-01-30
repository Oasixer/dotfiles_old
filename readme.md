# Description
Just my linux dotfiles and other config

* Note: there are instructions for setting up eduroam on linux, see the eduroam subdirectory

# Useful system commands

## backlight
xbacklight set n 
    # 0 <= n <= 100

## monitors
### installation
* https://wiki.archlinux.org/index.php/DisplayLink#Setting_up_X_Displays
* https://wiki.archlinux.org/index.php/Multihead

### enable triple mon
xrandr --output DVI-I-2-2 --mode 1920x1080 --right-of eDP1 --output DVI-I-1-1 --mode 1920x1080 --right-of DVI-I-2-2

### enable dual monitor, disable laptop
xrandr --output eDP1 --off --output DVI-I-2-2 --mode 1920x1080 --primary --output DVI-I-1-1 --mode 1920x1080 --right-of DVI-I-2-2

## Use vimrc in sudo nvim
sudo -E nvim file

## Grep from command result
any_command | grep `find_this` | cut -f1 
