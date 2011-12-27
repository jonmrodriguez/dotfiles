#!/bin/bash



PROJECT_PATH='/Users/jon/Dropbox/git'
alias whisper='echo >/dev/null'     #  hopefully self-explanatory



###
# Path
###

# add to path
#  note that anything path_added from jon's bashrc
#  won't be on the root path for sudo
path_add()
{
PATH=$PATH:$1
}


# new_project puts soft links to new projects' commands here
path_add /opt/local/bin/new_project_jon

# TODO replace all the aliases with soft links
# in /opt/local/bin/new_project_jon


###
# tput
###

# tput init  Apparently both not necessary and buggy (outputs !p to the screen). Fuck that shit.

# also, I made a python module in site-packages called tput.py


###
# Prompt
###



# begin prompt

PS1='\[$(

whisper "everything before the clear gets into the transcript only";

tput bold;


tput setaf $(grep -o "/" <(pwd) | wc -w);




)\]'"$newline_string_for_prompt"'\u @ \h : \w\n\[$( tput sgr0 )\]$ '

rm -f ~/.show_prompt_newline
PROMPT_COMMAND='
if [ -a ~/.show_prompt_newline ]
then
echo
echo
fi
touch ~/.show_prompt_newline
'
# end prompt












###
# ls
###

alias l='"ls"'

alias lrecent='l -1ctr'

alias ll='"ls" -l'

alias ls='ls_categorized' # in /opt/local/bin/new_project_jon




###
# hardware
# :-D
###

# brightness
# wifi
# volume

# TODO bluetooth
# goal: be able to pipe sound between computers, providing play-sync from ANY program (just as a virtual speaker device)

# note: brightness takes one arg: a float in [0.0, 1.0]
# or brightness -l to list

# wifi help  (wifi is a soft link to wifi_util)





# aliases for ssh'ing places
# always uses -X
#
alias sair='ssh -X jon@jrodair.stanford.edu -t bash'
alias smyth='ssh -X jonr1@myth.stanford.edu -t bash'
alias scorn='ssh -X jonr1@corn.stanford.edu -t bash'
alias sacer='ssh -X jonr1@jrodacer.stanford.edu -t bash'
alias sseq='ssh -X jonr1@seq2.stanford.edu -t bash' # from here can ssh to tako











###
# mvim and vim
###

alias legacy_vim='"vim"'
alias vim='mvim'










# make "cd -" g o to the old place
alias mempwd='$PROJECT_PATH/mempwd/mempwd.py'

cd2()
{
'cd' "$@"
mempwd
touch $PROJECT_PATH/lsd/wake_lsd.txt
}
alias cd='cd2'

source $PROJECT_PATH/mempwd/set_OLDPWD.bash # sets OLDPWD
# now, cd - when you first open a window goes to the old place :)























# less and top UXiness
alias less='less -W'
alias top='top -d'

# swap the convention:
# now, by default, less lesses a command's output
# to less a file, use "less cat"
# currently broken, don't know why
# function less {
# 'less' <($1) # quotes say to use the original less
# }

# for mac:
alias app="open -a"













# TODO
# make a text editor that puts each block that begins with
###
# into its own tab


















###

# this is for an open source proj called j2

export JPY=$PROJECT_PATH/j2/j.py
source $PROJECT_PATH/j2/j.sh

#

trash()
{
mv $@ ~/.Trash/
}

# allow using up and down arrows to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# lsd, the ls daemon
# lsd is intended to run in a full-screen vertical pan
# lsd prettily lsifies your files every time you cd somewhere
. $PROJECT_PATH/lsd/init.py

# fink
. /sw/bin/init.sh
# TODO check PATH before and after to see how fink's init manipulates it

# airport -z # disconnects from network
# networksetup -getairportnetwork en0
# networksetup -setairportnetwork en0 NETWORK_NAME PASSWORD
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'





# for MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH




# reverse the order of lines
alias reverse='tail -r' 

# not bothering to individually label
source $PROJECT_PATH/new_project/init.bash


# experimental

# created by new_project

source /Users/jon/Dropbox/git/space_derivatives_of_nd_matrix/init.bash
source /Users/jon/Dropbox/git/say_the_time/init.bash
source /Users/jon/Dropbox/git/touchmod/init.bash
source /Users/jon/Dropbox/git/bash_fn/init.bash
source /Users/jon/Dropbox/git/tput/init.bash
source /Users/jon/Dropbox/git/AWS/init.bash
source /Users/jon/Dropbox/git/wifi_util/init.bash
source /Users/jon/Dropbox/git/battery/init.bash

