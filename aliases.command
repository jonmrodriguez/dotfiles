#! /bin/bash

###
### all hosts: jrodair, corn, myth
###
###


#
## Navigation
#

alias dg="cd $DG"
alias dotfiles="cd $DG/dotfiles"


#
## Memory management
#

alias mpurge='mem_usage && purge && mem_usage'


#
## Recursion of shells
#

alias lvl='echo $SHLVL'


#
## git aliases start with capital G
#

G_commit_am_push()
{
git commit -am "$1" && git push
}

