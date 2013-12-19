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

# disabled due to use of pythonbrew
# setup python virtualenvwrapper
#if [ `id -u` != '0' ]; then
  #export VIRTUALENV_USE_DISTRIBUTE=1        # <-- Always use pip/distribute
  #export WORKON_HOME=$HOME/.virtualenvs       # <-- Where all virtualenvs will be stored
  #source /usr/local/bin/virtualenvwrapper.sh
  #export PIP_VIRTUALENV_BASE=$WORKON_HOME
  #export PIP_RESPECT_VIRTUALENV=true
#fi

export SHELL="/usr/bin/zsh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM functio
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && . "$HOME/.pythonbrew/etc/bashrc" # load pythonbrew
