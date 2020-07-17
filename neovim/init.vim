"####### Tobias Johansson Nvim config ######
"Repo: https://github.com/tobiasdev
"Version: 0.2.2
"Changes: Added FZF plugin and keyboard shortcuts to use it 

" ###### HOST ######
" ### PYTHON ###
" let g:python3_host_prog = 'C:\Python38\python.exe'

" ###### PLUGIN MANAGER ######
" check whether vim-plug is installed and install it if not
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'

if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif


" ###### PLUGINS ######
"Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
    " ### Faster search and find plugins ### 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	" ### Markdown ###
    Plug 'plasticboy/vim-markdown'
    " ### Better git in VIM ###
	Plug 'tpope/vim-fugitive'
    " ### Add a better file-explorer to VIM ###
	Plug 'scrooloose/nerdtree'
    " ### Web-Development plugins ###
	Plug 'ap/vim-css-color'
call plug#end()

" ###### CONFIGURATION ######
syntax enable
colorscheme relaxed-dark
set encoding=utf-8
set cursorline
set number

"Change tabs to be similar to Visual Studio Code since most other people I
"work with use that
set tabstop=4
set shiftwidth=4
set expandtab

"If possible the terminal will use the colors from "Relaxed Dark"
set termguicolors 

" ### PLUGIN SPECIFIC CONFIGURATION ###
let g:vim_markdown_folding_disabled=1

" ###### Personalized keyboard shortcuts #####
" ### NORMAL MODE ###
"Holding down CTRL and using hl moves me to the start or end of a sentence
nnoremap <C-h> <esc>0
nnoremap <C-l> <esc>$

"Holding down ALT and using jk moves the full line up or down
nnoremap <m-j> <esc>ddp
nnoremap <m-k> <esc>ddkP

"Add so paste comes from the OS Clipboard
nnoremap <C-v> <esc>"+p

"Tab will move between open Windows
nnoremap <tab> <esc><c-w>w

nnoremap <m-q> <esc>:q<enter>

" ### VISUAL MODE ###
"Adds the "standard" copy and paste behaviour
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" ### INSERT MODE ###
"Add CTRL+V to paste from OS Clipboard
inoremap <C-v> <esc>"+pi

"Holding down ALT and using jk moves the full line up or down
inoremap <m-j> <esc>ddpi
inoremap <m-k> <esc>ddkPi

" ### Plugin-specific ###
" # FZF #
nnoremap <C-p> <esc>:Files<CR>
inoremap <C-f> <esc>:Lines<CR>
