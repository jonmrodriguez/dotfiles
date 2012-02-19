#!/bin/bash

# bashrc for stanford afs space



prompt_color=4
PS1='\n\n\[$( tput bold ; tput setaf '$prompt_color' )\]\u @ \h : \w\n$\[$( tput sgr0 )\] '

# next thing blah blah. Git identity?

# aliases for ssh'ing places
# always uses -X

alias sair='ssh -X jon@jrodair.stanford.edu -t bash'
alias sacer='ssh -X jonr1@jrodacer.stanford.edu -t bash'

# no need to wrap with sshpass bc we are already within stanford's walls
# (and our username is already jonr1, so technically those jonr1@'s aren't needed either)
alias smyth='ssh -X jonr1@myth.stanford.edu -t bash'
alias scorn='ssh -X jonr1@corn.stanford.edu -t bash'
alias sseq='ssh -X jonr1@seq2.stanford.edu -t bash' # from here can ssh to tako


# side note:
# woah, in vim's default/outermost mode (without the colon),
# apparently # is a command that highlights all instances of the word under the cursor. AWESOME!

# actually dont do this because gvim doesnt work inside of gnu screen.
# alias vim=gvim # because gvim is MacVim. Need to be forwarding X11.

alias l='ls'




# editors
export VISUAL='vim'




# path
export DG='/afs/ir/users/j/o/jonr1/Documents/git/'
export PATH=$PATH:$DG/bin








# the latest place I am working
cd ~
cd 'Desktop/cs110 2 threads'

