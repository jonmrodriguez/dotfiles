#!/bin/bash

# bashrc for stanford afs space



prompt_color=4
PS1='\n\n\[$( tput bold ; tput setaf '$prompt_color' )\]\u @ \h : \w\n$\[$( tput sgr0 )\] '

# next thing blah blah. Git identity?

# aliases for ssh'ing places
# always uses -X

# for some reason the jrodair hostname lookup often fails
# alias sair='ssh -X jon@jrodair.stanford.edu -t bash'
alias sair='ssh -X jon@128.12.10.42 -t bash'

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

alias ls='ls_categorized'
alias l="'ls'"




# editors
export VISUAL='vim'



# readline
# allow using up and down arrows to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'



# path
export DG='/afs/ir/users/j/o/jonr1/Documents/git/'
export PATH=$PATH:$DG/bin



# less
# although less works fine on corn, less on myth crashes, so just use less=more on both
alias less='more'




###
### Prompt
###

# begin prompt

# the -4 on the slash count is to compensate for the fact that
# ~ is at depth 6 on afs, but depth 2 on jrodair
export PS1='\n\n'

export PS1=$PS1\
'\[$(


tput bold;

PS1_internal_count=$[ $(grep -o "/" <(pwd) | wc -w) - 4 ];

if [ $PS1_internal_count -lt 1 ]
then
PS1_internal_count=1
fi

tput setaf $PS1_internal_count;


)\]'


export PS1=$PS1\
'\u @ \h : \w\n\[$(


tput sgr0;

find . -maxdepth 1 -type d | tail -n +2 | tr "\n" " ";


)\]'

export PS1=$PS1\
'\n'

export PS1=$PS1\
'\[$(

tput bold;
tput setaf 2;
echo "\$";
tput sgr0;


)\]'

# \$ ' # string literal

# end prompt




# the latest place I am working
cd ~
cd 'Desktop/cs110 3 optimize/code'



# no harm in deffing this macro on all unix systems, even if I'll only use it on Darwin
# in the future, I can have a more intelligence spotify.py that uses the correct way to
# control spotify on both darwin and linux
spotify()
{
osascript -e "tell application \"Spotify\" to $*"
}




# extended globbing
# see linuxjournal.com/content/bash-extended-globbing
shopt -s extglob

