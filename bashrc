#!/bin/bash




alias whisper='echo >/dev/null'     #  hopefully self-explanatory



###
# tput
###

# tput init  Apparently both not necessary and buggy (outputs !p to the screen). Fuck that shit.
alias tput_color='~/Dropbox/git/tput/tput_color.py'







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
# the grep command is grepping for lines that start with the letter d
alias ls_apps='"ls" -l | grep "^d" | grep ".app$"'
alias ls_dirs='"ls" -l | grep "^d" | grep -v ".app$"'
alias ls_slinks='"ls" -l | grep "^l"'  # soft symlinks
alias ls_files='"ls" -l | grep "^-"'   # non-dir, non-symlink files
alias ls='

echo;
tput bold;
echo "APPS"
tput sgr0;
ls_apps;
echo ;

tput bold;
echo "DIRECTORIES"
tput sgr0;
ls_dirs;
echo ;

tput bold;
echo "SOFT LINKS";
tput sgr0;
ls_slinks ;
echo ;

tput bold;
echo "FILES";
tput sgr0;
ls_files;
' # end ls alias

# alias ls='~/Dropbox/git/ls/ls.py'





###
# tput # wraps libcurses (as discovered via: 'tput -V')
###

tput2()
{
 echo "in tput2"
}







###
# hardware
# :-D
###


# note: brightness takes one arg: a float in [0.0, 1.0]


# I wrote this :)
alias wifi_util='~/Dropbox/git/wifi_util' 





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
alias mempwd='~/Dropbox/git/mempwd/mempwd.py'

cd2()
{
'cd' "$@"
mempwd
touch ~/Dropbox/git/lsd/wake_lsd.txt
}
alias cd='cd2'

source ~/Dropbox/git/mempwd/set_OLDPWD.bash # sets OLDPWD
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

export JPY=~/Dropbox/git/j2/j.py
source ~/Dropbox/git/j2/j.sh

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
. ~/Dropbox/git/lsd/init.py

# fink
. /sw/bin/init.sh
# TODO check PATH before and after to see how fink's init manipulates it

# airport -z # disconnects from network
# networksetup -getairportnetwork en0
# networksetup -setairportnetwork en0 NETWORK_NAME PASSWORD
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'





# for MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH






# append here

