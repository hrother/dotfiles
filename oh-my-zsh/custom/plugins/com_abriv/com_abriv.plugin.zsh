# Aliases for commandos

# tmux should allways assume a 256 color shell
alias tmux='tmux -2'

# invoke tdeamon
alias td_all='tdaemon -t nose --custom-args="--with-notify --no-start-message --with-coverage --cover-package=trebuchet --with-freshen -v"'
alias tdf='tdaemon -t nose --custom-args="--with-notify --no-start-message --with-freshen -v"'

# for zsh config
alias sz='source ~/.zshrc'
alias ez='vi ~/.zshrc'
alias eca='vi ~/.oh-my-zsh/custom/com_abriv.zsh'
alias eda='vi ~/.oh-my-zsh/custom/dir_abirv.zsh'

alias j='jobs -l'
alias c='clear'

# listing stuff (fun with ls)
alias dir="ls -lSrah"
alias lad='ls -d .*(/)'                # only show dot-directories
alias lsa='ls -a .*(.)'                # only show dot-files
# Not working, why??
#alias lss='ls -l *(s,S,t)'             # only files with setgid/setuid/sticky flag
#alias lsl='ls -l *(@)'                 # only symlinks
alias lsx='ls -l *(*)'                 # only executables
alias lsw='ls -ld *(R,W,X.^ND/)'       # world-{readable,writable,executable} files
alias lsbig="ls -flh *(.OL[1,10])"     # display the biggest files
alias lsd='ls -d *(/)'                 # only show directories
alias lse='ls -d *(/^F)'               # only show empty directories
alias lsnew="ls -rtlh *(D.om[1,10])"   # display the newest files
alias lsold="ls -rtlh *(D.Om[1,10])"   # display the oldest files
alias lssmall="ls -Srl *(.oL[1,10])"   # display the smallest files

# enable color for pipes
alias cgrep='grep --color=always'
alias ress='less -R'

# simple webserver
check_com -c python && alias http="python -m SimpleHTTPServer"

alias 2day='date --rfc-3339=date'

# invoke program based on ending
if [[ $DISPLAY = '' ]] then
  alias -s txt=vim
  alias -s tex=vim
else
  alias -s pdf='evince'
  alias -s html=$BROWSER
  alias -s jpg=eog
  alias -s JPG=eog
  alias -s png=eog
  alias -s PNG=eog
fi

alias evince='evince 2> /dev/null'

# use ctr+z to fg vim
zle -N foreground-vi
bindkey '^Z' foreground-vi
