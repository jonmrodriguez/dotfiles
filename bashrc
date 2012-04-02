#!/bin/bash


# see here for why to use export: http://stackoverflow.com/questions/1158091/bash-defining-a-variable-with-or-without-export

export PROJECT_PATH='/Users/jon/Dropbox/git'
export DG="$PROJECT_PATH" # DG for Dropbox/git/
export PY_LIBS_DIR=$DG/py_libs

# already set but not part of the default exported environ on jrodair
export HOSTNAME
export OSTYPE



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

# version 2.0 of new_project puts new soft links here
path_prepend /jon/bin/new_project
# version 1.0 of new_project used to put new soft links here
# some links are still in that folder
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

# TODO where do the new_project items fall in the following?
# TODO just echo $PATH and put that shit here brah
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
# Editors
###

export VISUAL='vim'


###
# lvl
###
alias lvl='echo $SHLVL'



###
# Prompt
###

export PS1=""
export PROMPT_COMMAND="prompt.py"











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






#
export default_dir=$(bookmark --recentest)
cd $default_dir

# make "cd -" go to the old place
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








source $DG/dotfiles/aliases.command







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
alias screenshots='open ~/Dropbox/screenshots'


# append to HISTFILE instead of overwriting
shopt -s histappend

# reverse the order of lines
alias reverse='tail -r' 


#### experimental

# carry over the cd $there concept from new_project to other commands that make places
# note working yet (just make a python script): alias mkdir='save_param=$1 ; mkdir $save_param; echo $save_param; abspath $save_param > /Users/jon/sandbox/mkdir_there.txt ; export there=$(cat /Users/jon/sandbox/mkdir_there.txt)' # the hop through a temporary file is because bash doesn't seem to nest $ signs, so I cant just export there=$(abspath $1)
alias slowcat='slowcat -d 500000' # bigger number means slower. seems like max is around 500000, after which it's instant

# the sourcing is the outer half of a kludged protocol to let
# new_project.py export env vars via stderr
# =D
alias new_project='source wrap_new_project'

cd_project()
{
cd $(dirname $(readlink $(which $1)))
}

# similarly, stealth_mode needs to be sourced
# so it can export HISTIGNORE='*'
alias stealth_mode='source wrap_stealth_mode'


# looked for .sb sandbox environments in the gitted directory /jon/share/sandbox
alias jail_me='sandbox-exec -n jail2 bash --norc'


#### created by new_project

source /Users/jon/Dropbox/git/wifi_util/init.bash
source /Users/jon/Dropbox/git/battery/init.bash


# python
alias p=python

# extended globbing
# see linuxjournal.com/content/bash-extended-globbing
shopt -s extglob

