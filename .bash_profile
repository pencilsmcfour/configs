# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Prompt
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


UNCOLORED_TEXT="\[\033[00m\]"

BLACK="\[\033[30m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
BLUE="\[\033[34m\]"
MAGENTA="\[\033[35m\]"
CYAN="\[\033[36m\]"
WHITE="\[\033[37m\]"

BRIGHT_BLACK="\[\033[01;30m\]"
BRIGHT_RED="\[\033[01;31m\]"
BRIGHT_GREEN="\[\033[01;32m\]"
BRIGHT_YELLOW="\[\033[01;33m\]"
BRIGHT_BLUE="\[\033[01;34m\]"
BRIGHT_MAGENTA="\[\033[01;35m\]"
BRIGHT_CYAN="\[\033[01;36m\]"
BRIGHT_WHITE="\[\033[01;37m\]"

export PS1="________________________________________________________________________________\n| ${BRIGHT_CYAN}\w ${UNCOLORED_TEXT}@ ${BRIGHT_GREEN}\h ${BRIGHT_BLUE}(\u) \
\n${UNCOLORED_TEXT}| => "
export PS2="| => "

# Colored output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
