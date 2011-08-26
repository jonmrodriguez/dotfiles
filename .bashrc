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

