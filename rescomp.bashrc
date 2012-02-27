#! /bin/bash

# for now, use myth's
# TODO set up the bashrcs to be with the shared code in dotfile/bashrc itself

dotfiles='/afs/ir/users/j/o/jonr1/Documents/git/dotfiles/'

source $dotfiles/myth.bashrc

alias bbedit='open -a BBEdit'

## change PS1. we don't want the -4


# begin prompt

export PS1='\[$(


tput bold;


tput setaf $(grep -o "/" <(pwd) | wc -w);


)\]'"$newline_string_for_prompt"'\u @ \h : \w\n\[$( tput sgr0 )\]$ '

# end prompt