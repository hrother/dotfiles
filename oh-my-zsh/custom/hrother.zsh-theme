function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
        PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi

    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
        ref=$(git symbolic-ref HEAD 2> /dev/null)
        local gitbranchsize=${#${ref#refs/heads/}}
        local gitmarkup=${#${(%):-|-(git:()--|)}}
        PR_SPACEBAR="\${(l.(($TERMWIDTH - ($gitbranchsize + $gitmarkup )))..${PR_SPACE}.)}"
        PR_GIT="
$PR_GREY$PR_VRBAR$PR_WHITE$PR_HBAR(\
$PR_WHITE%{$(git_prompt_info)%}\
$PR_WHITE)${(e)PR_SPACEBAR}$PR_GREY$PR_VBAR"

    else
        PR_GIT=''
    fi


    ###
    # Get APM info.

    if which ibam > /dev/null; then
	PR_APM_RESULT=`ibam --percentbattery`
    elif which apm > /dev/null; then
	PR_APM_RESULT=`apm`
    fi
}


setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
	local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
    fi
}


setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst


    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
        eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        (( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"


    ###
    # See if we can use extended characters to look nicer.
    PR_SPACE=' '
    PR_HBAR='━'
    PR_VBAR='┃'
    PR_VRBAR='┣'
    PR_ULCORNER='┏'
    PR_LLCORNER='┖'
    PR_LRCORNER='┛'
    PR_URCORNER='┓'
    
    ###
    # Decide if we need to set titlebar text.
    
    case $TERM in
	xterm*)
	    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
	    ;;
	screen)
	    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
	    ;;
	*)
	    PR_TITLEBAR=''
	    ;;
    esac
    
    
    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
    else
	PR_STITLE=''
    fi
    
    
    ###
    # APM detection
    
    if which ibam > /dev/null; then
	PR_APM='$PR_WHITE${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
    elif which apm > /dev/null; then
	PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
    else
	PR_APM=''
    fi
    
    
    ###
    # Finally, the prompt.

    PROMPT='$PR_STITLE${(e)PR_TITLEBAR}\
$PR_GREY$PR_ULCORNER$PR_WHITE$PR_HBAR(\
$PR_GREEN%(!.%SROOT%s.%n)$PR_BLUE@%m:%l\
$PR_WHITE)$PR_HBAR$PR_GREY$PR_HBAR${(e)PR_FILLBAR}$PR_WHITE$PR_HBAR(\
$PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
$PR_WHITE)$PR_HBAR$PR_GREY$PR_URCORNER\
$PR_GIT\

$PR_GREY$PR_LLCORNER$PR_WHITE$PR_HBAR(\
%(?..$PR_RED%?$PR_GREY:)\
${(e)PR_APM}$PR_GREY%D{%H:%M}\
$PR_LIGHT_WHITE:%(!.$PR_RED.$PR_WHITE)%#$PR_WHITE)$PR_HBAR\
$PR_GREY$PR_HBAR\
$PR_RED ↦ $PR_NO_COLOUR '

    RPROMPT=' $PR_GREY$PR_HBAR$PR_WHITE$PR_HBAR\
($PR_GREY%D{%a,%b%d}$PR_WHITE)$PR_HBAR$PR_GREY$PR_LRCORNER$PR_NO_COLOUR'

    PS2='$PR_GREY$PR_HBAR\
$PR_WHITE$PR_HBAR(\
$PR_LIGHT_GREY%_$PR_WHITE)$PR_HBAR\
$PR_GREY$PR_HBAR$PR_NO_COLOUR '
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[grey]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


setprompt
#function battery_charge {
#  echo `~/misc/playground/batmeter/batmeter.py` 2>/dev/null
#
#}
#
#RPS1='$(battery_charge)'
