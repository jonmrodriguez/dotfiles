"   VIM AND MVIM

set mouse=a

set number " line numbers

set autoindent " THANK GOD


" Each indentation level is four spaces. Tabs are not used.
" from http://tedlogan.com/techblog3.html
set softtabstop=4 shiftwidth=4 expandtab



" Press f5 to run the selected lines using python
" TODO might need to set a remap for SELECT mode too

" the first n in nnoremap means that this remap takes effect in normal mode
" the ggVG visually selects all, and leaves the editor in visual mode
" the : starts command mode and the !python is a filter that replaces the current contents of the editor with the python results
" type 'u' to undo the filter and bring back the code
nnoremap <f5> ggVG:!python<CR>

" for use after visually selecting just a few lines
vnoremap <f5> :!python<CR>


" from http://stackoverflow.com/a/235970/402807
" highlight chars beyond column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/





