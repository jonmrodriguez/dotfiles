#!/bin/bash

# values local to this machine
source ~/.local_values.bash

# prompt
if [ $client_or_server = 'client' ]
then
  # client prompt is blue
  prompt_color='4'
else
  # server prompt is pink
  prompt_color='5'
fi

PS1='\n\n\[$( tput bold ; tput setaf '$prompt_color' )\]\u @ \h : \w\n$\[$( tput sgr0 )\] '

# next thing blah blah. Git identity?

# aliases for ssh'ing places
# always uses -X

alias sair='ssh -X jon@jrodair.stanford.edu -t bash'
alias smyth='ssh -X jonr1@myth.stanford.edu -t bash'
alias scorn='ssh -X jonr1@corn.stanford.edu -t bash'
alias sacer='ssh -X jonr1@jrodacer.stanford.edu -t bash'
alias sseq='ssh -X jonr1@seq2.stanford.edu -t bash' # from here can ssh to tako

