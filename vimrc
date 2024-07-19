" LAUNCH .vimrc {{{
" 1) Download patched font (devicon) here: https://www.nerdfonts.com/font-downloads and set in OS
" 2) Download Vundle (https://github.com/VundleVim/Vundle.vim)
" 3) ex-vundle command :PluginInstall, to install all plugins
" }}}


" ИДЕИ:
" Настроить нормальную копию в gui версии
" GDB в VIM
" Оболочка в VIM
" Копия до текущей директории
" Комментирование C строки
" Смена языка на панели
" Автоматическое удаление пробелов при сохранении буфера
" Клавиша вставки пробела и вход в normal mode
" Сверху должны быть \

" ПРИМЕЧАНИЯ:
" При открытии файла делать retab!

" VUNDLE {{{
set nocompatible
filetype off

set rtp+=/home/tapok/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
let g:airline_section_z = '%{line(".")}' . "/" . '%{col(".")}' 

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
set hlsearch " :nohl - disable last highlight
" }}}

" UI {{{
set encoding=utf8
set guifont=FiraCode\ Nerd\ Font\ Mono\ Medium\ 12
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
" }}}

" set spell
" INDENT {{{
set list 
set lcs=tab:\¦\.
set number
set tabstop=4 " tabstop < softtabstop
set softtabstop=0 " - disable
set shiftwidth=4
set smarttab
set noexpandtab " spaces -> tabs
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

" AUTOCOMPLETE {{{
" set completeopt=menu, preview - default
" }}}

" TAGS {{{
set taglength=0 " all symbols - important
set tags="./tags,tags"
" set tagrelative=true " При использовании тегов из другого каталога, адресация файлов будет относительна файла тегов
" }}}

" ex {{{
set autochdir " ex будет производить действия из дирректории, в которой находится редактируемый файл
" }}}

" LINE MAPPING (перенос текста) {{{
set nowrap " не переносить
set wrapmargin=0 " количество символов от правой стороны экрана, с которых начинается перенос строки
" }}}

set formatoptions+=w
