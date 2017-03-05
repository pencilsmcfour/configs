#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=6000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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

# TODO: alternate colors while printing sub-dir names. Keep the slash the same color.
# TODO: give a different symbol for changes, new files, deleted files in git
# TODO: move the user name and current working directory

export PS1="\
\$(if [[ \$? -ne 0 ]] ; then echo -n '\[\033[01;31m\]' ; fi)\
\$(i=0 ; while [[ i -lt COLUMNS ]] ; do echo -n '_'; : \$((i=i+1)) ; done)\n\
${BRIGHT_YELLOW}| ${BRIGHT_CYAN}\w ${UNCOLORED_TEXT}@ ${BRIGHT_GREEN}\h ${BRIGHT_BLUE}(\u) \
${UNCOLORED_TEXT}[${BRIGHT_MAGENTA}\t${UNCOLORED_TEXT}] \
${BRIGHT_YELLOW}\$(git branch 2>/dev/null | awk '\$1 == \"*\" { print \$2 }') \
${BRIGHT_RED}\$(test \$(git status --porcelain 2>/dev/null | wc -l) -ne 0 && echo -ne \"\xce\x94\") \
\n${BRIGHT_YELLOW}| ${BRIGHT_MAGENTA}\! ${BRIGHT_YELLOW}=> ${UNCOLORED_TEXT}"
export PS2="| => "

# Colored output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# golang
LENGTH_1="1" # non-zero length
DESIRED_GOPATH=~/gopath
GO_INSTALL_PATH=/usr/local/go
if [[ -z ${GOPATH+LENGTH_1} && -e ${GO_INSTALL_PATH} && -d ${DESIRED_GOPATH} ]] ; then
	export GOPATH=${DESIRED_GOPATH}
fi
unset LENGTH_1
GO_BIN=/usr/local/go/bin/go
GO_BIN_DIR=$(dirname ${GO_BIN})
if [[ -e ${GO_BIN} && ! ${PATH} =~ (:|^)${GO_BIN_DIR}(:|$) ]] ; then
	PATH=${PATH}:${GO_BIN_DIR}
fi
