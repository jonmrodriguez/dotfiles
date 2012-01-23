#!/bin/bash


# see here for why to use export: http://stackoverflow.com/questions/1158091/bash-defining-a-variable-with-or-without-export

export PROJECT_PATH='/Users/jon/Dropbox/git'
export DG="$PROJECT_PATH" # DG for Dropbox/git/
alias whisper='echo >/dev/null'     #  hopefully self-explanatory



###
# Path
###

# add to path
#  note that anything path_added from jon's bashrc
#  won't be on the root path for sudo
#   BUT there is an way to make it so it is available to sudo
#    just use "sudo visudo" to edit /etc/sudoers,
#    and in that file, add PATH, MAN_PATH, and whatever other
#    compiler include paths and linker library paths I want
#    to the Default called "env_keep".  :-D
path_append()
{
export PATH=$PATH:$1
}

path_prepend()
{
export PATH=$1:$PATH
}

# PKG_CONFIG_PATH for pkg-config
#
# oblong g-speak
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/oblong/g-speak-32-2/lib/pkgconfig
#
# for opencv 2.3 ; see the README in that folder
export PYTHONPATH=$PYTHONPATH:/Users/jon/Dropbox/git/Libraries/opencv_python_bindings

# new_project puts soft links to new projects' commands here
path_append /opt/local/bin/new_project_jon

# fink
. /sw/bin/init.sh
# TODO check PATH before and after to see how fink's init manipulates it

# (2) for MacPorts
path_prepend /opt/local/bin:/opt/local/sbin
# TODO also export MANPATH=/opt/local/share/man:$MANPATH
#  (see http://stackoverflow.com/questions/1333569/how-does-macports-install-packages-how-can-i-activate-a-ruby-installation-done )


# (0)
path_prepend /jon/bin

# TODO path as follows
# 0. /jon/bin
# 1. /usr/bin
# 2. /opt/bin # MacPorts
# /Applications # with proper wrap to call the executable in the bundle
# 4. /sw/bin
# only for root_jon: /CoreServices # with proper wrap to call the executable in the bundle # root jon is equiv powerful as root, but with customizable bashrc and path




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

export AWS_VERGENCE_0='ec2-50-16-100-213.compute-1.amazonaws.com'
alias saws='ssh $AWS_VERGENCE_0'




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







# find
#
# -L means follow soft links, which is needed in order to get deeper than /places_to_find
# the 2> is stderr redirection
find_by_name()
{
find -L /places_to_find -name "$@" 2>/dev/null
}




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


# airport -z # disconnects from network
# networksetup -getairportnetwork en0
# networksetup -setairportnetwork en0 NETWORK_NAME PASSWORD
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'


# screenshots: viewing and TODO creating
alias see_screenshots='open ~/Dropbox/screenshots'


# append to HISTFILE instead of overwriting
shopt -s histappend

# reverse the order of lines
alias reverse='tail -r' 


#### experimental

# the sourcing is the outer half of a kludged protocol to let
# new_project.py export env vars via stderr
# =D
alias new_project='source wrap_new_project'


# looked for .sb sandbox environments in the gitted directory /jon/share/sandbox
alias jail_me='sandbox-exec -n jail2 bash --norc'


#### created by new_project

source /Users/jon/Dropbox/git/wifi_util/init.bash
source /Users/jon/Dropbox/git/battery/init.bash

alias p=python
cd ~/gitolite/cv/ar/