#!/bin/bash

# bashrc for stanford afs space



prompt_color=4
PS1='\n\n\[$( tput bold ; tput setaf '$prompt_color' )\]\u @ \h : \w\n$\[$( tput sgr0 )\] '


# side note:
# woah, in vim's default/outermost mode (without the colon),
# apparently # is a command that highlights all instances of the word under the cursor. AWESOME!

# actually dont do this because gvim doesnt work inside of gnu screen.
# alias vim=gvim # because gvim is MacVim. Need to be forwarding X11.

alias ls='ls_categorized'
alias l="'ls'"




# editors
export VISUAL='vim'



# readline
# allow using up and down arrows to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'



# path
export DG='/afs/ir/users/j/o/jonr1/Documents/git/'
export PY_LIBS_DIR='/afs/ir/users/j/o/jonr1/Documents/git/py_libs'
export PATH=$PATH:$DG/bin



# less
# although less works fine on corn, less on myth crashes, so just use less=more on both
alias less='more'




###
### Prompt
###

export PS1=""
export PROMPT_COMMAND="prompt.py"

# end prompt




# the latest place I am working
cd ~
cd 'Desktop/cs110_2_threads/code'



# no harm in deffing this macro on all unix systems, even if I'll only use it on Darwin
# in the future, I can have a more intelligence spotify.py that uses the correct way to
# control spotify on both darwin and linux
spotify()
{
osascript -e "tell application \"Spotify\" to $*"
}




###
# lvl
###
alias lvl='echo $SHLVL'





# extended globbing
# see linuxjournal.com/content/bash-extended-globbing
shopt -s extglob





###
# projects
###

# TODO new_project

cd_project()
{
cd $(dirname $(readlink $(which $1)))
}


