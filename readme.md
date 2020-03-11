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

## vim
* Use vimrc in sudo nvim
sudo -E nvim file

* Use process substitution to open command output like a file
vim <(any_command)
vim <(ls -a)

## Grep
* from command result
    * Grep for command result from other command result
        any_command | grep `other_command` | cut -f1

    * Grep for string from command result
        any_command | grep "example search string" | cut -f1


* Grep and only show up to N surrounding characters
    grep -r -E -o ".{0,10}wantedText.{0,10}" *
        -E tells, that you want to use extended regex
        -o tells, that you want to print only the match
        -r grep is looking for result recursively in the folder
