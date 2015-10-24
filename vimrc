" Tabs{{{
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab 
" }}}
" Search {{{
set showmatch " highlight matching parens
set incsearch " search as characaters are entered
set hlsearch " highlight search matches
" }}}
" Folding {{{
set foldenable " folding turned on
set foldlevelstart=10 " unfold most things by default
" }}}
" Misc {{{
set number      " line numbers on
set modelines=1 " so i can use modeline in this file
set showcmd     " show command in bottom bar
set wildmenu    " for autocomleting menu commands 
syntax enable   " turn on syntax
" }}}
" Plugins {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
" }}}
" vim:foldmethod=marker:foldlevel=0
