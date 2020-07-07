" ###### Tobias Johansson init ######
" Repo: https://github.com/tobiasdev
" Version: 0.1

" ###### HOST ######
" ### PYTHON ###
" let g:python3_host_prog = 'Add path to python 3 installation'

" ###### PLUGINS (Using VimPlug) ######
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
	Plug 'plasticboy/vim-markdown'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'ap/vim-css-color'
call plug#end()

" ###### CONFIGURATION ######
syntax enable
colorscheme relaxed-dark
set encoding=utf-8
set cursorline
set number

" Change tabs to be similar to Visual Studio Code since most other people I
" work with use that
set tabstop=4
set shiftwidth=4
set expandtab

" If possible the terminal will use the colors from "Relaxed Dark"
set termguicolors 

" ### PLUGIN SPECIFIC CONFIGURATION ###
let g:vim_markdown_folding_disabled=1

" ###### Personalized keyboard shortcuts ######
" ### NORMAL MODE ###
" Holding down CTRL and using hl moves me to the start or end of a sentence
nnoremap <c-h> <esc>0
nnoremap <c-l> <esc>$

" Holding down ALT and using jk moves the full line up or down
nnoremap <m-j> <esc>ddp
nnoremap <m-k> <esc>ddkP

" ### INSERT MODE ###
" Holding down CTRL and using hjkl make the cursor move like in Normal mode
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>

" Holding down ALT and using jk moves the full line up or down
inoremap <m-j> <esc>ddpi
inoremap <m-k> <esc>ddkPi
