"   VIM AND MVIM

set mouse=a

set number " line numbers

set autoindent " THANK GOD






" the first n in nnoremap means that this remap takes effect in normal mode
" the ggVG visually selects all, and leaves the editor in visual mode
" the : starts command mode and the !python is a filter that replaces the current contents of the editor with the python results
" type 'u' to undo the filter and bring back the code
nnoremap <f5> ggVG:!python<CR>

" for use after visually selecting just a few lines
vnoremap <f5> :!python<CR>






"   MVIM-specific codez


colorscheme ron

set guifont=Monaco:h16
" set guifont=MS\ Reference\ Sans\ Serif:h16
