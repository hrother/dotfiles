# Set Environement variables here

# set default browser
if [[ -z "$BROWSER" ]] ; then
    if [[ -n "$DISPLAY" ]] ; then
        #v# If X11 is running
        #check_com -c chromium-browser && export BROWSER=chromium-browser
        check_com -c google-chrome && export BROWSER=google-chrome
    else
        #v# If no X11 is running
        check_com -c w3m && export BROWSER=w3m
    fi
fi

# Disable Terminal Flow Control
stty -ixon

export TERM=screen-256color
export EDITOR='vim'
export SHELL="/usr/bin/zsh"
export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="$HOME/bin:$PATH"
