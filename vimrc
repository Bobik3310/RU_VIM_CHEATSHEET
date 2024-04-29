" VUNDLE {{{
set nocompatible 
filetype off

set rtp+=/home/tapok/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
set shell=/bin/bash

Plugin 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

"Plugin 'Yggdroot/indentLine'
"let g:indentLine_enabled = 1 
"let g:indentLine_color_term = 239
"let g:indentLine_conceallevel = 1
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_char = '¦'

Plugin 'tpope/vim-surround'

Plugin 'preservim/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%t'

Plugin 'ryanoasis/vim-devicons'
set t_RV= " Fix devicon bug
" Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()
filetype plugin indent on 

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

syntax on
" SEARCH {{{
set incsearch
set hlsearch " :nohl - temporary disable last highlight
" }}}
" UI {{{
set encoding=utf8
set guifont=FiraCode\ Nerd\ Font\ Mono\ Medium\ 12
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
" }}}
" set spell
" INDENT {{{
set list lcs=tab:\¦\ 
set number
set tabstop=4 " tabstop < softtabstop 
set softtabstop=0 " - disable
set shiftwidth=4 
set smarttab
set noexpandtab
set smartindent
" }}}
" VERTICAL/HORIZONTAL SCROLL {{{
set scrolloff=3
set sidescroll=0 
" }}}
" NERDTRee {{{
autocmd FileType nerdtree setlocal nolist
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" }}}
" FOLDING {{{
set foldmethod=manual
set foldcolumn=5
set foldenable
" }}}
