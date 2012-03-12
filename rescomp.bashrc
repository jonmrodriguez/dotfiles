#! /bin/bash

# for now, use myth's
# TODO set up the bashrcs to be with the shared code in dotfile/bashrc itself

dotfiles='/afs/ir/users/j/o/jonr1/Documents/git/dotfiles/'

source $dotfiles/myth.bashrc

alias bbedit='open -a BBEdit'



# TERM='xterm' grants mouse support
# TERM='ansi' grants numpad support
#
# http://particul.es/blog/index.php?post/Help-vi-and-iTerm-to-adopt-a-numpad
# http://swannie.net/index.php?title=Numeric+keypad+in+iTerm+with+vi&function=viewpage&pageid=24 # other solution, not using this
export TERM='xterm'

