"####### Tobias Johansson Nvim config ######
"Repo: https://github.com/tobiasdev
"Version: 0.4.1
"Changes: Getting snippets to work in NeoVim! 

"####### Commands to remember ######
" :ls - Shows all the last buffers (for if you accidently close one)

" ###### HOST ######
" ### PYTHON ###
let g:python3_host_prog = 'C:\Python38\python.exe'

" check whether vim-plug is installed and install it if necessary
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
call plug#begin('~/.vim/plugged')
    " ### Faster search and find ### 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	" ### Markdown ###
    Plug 'plasticboy/vim-markdown'
    Plug 'godlygeek/tabular'
    " ### Better git in VIM ###
	Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    " ### Add a better file-explorer to VIM ###
	Plug 'scrooloose/nerdtree'
    " ### Web-Development plugins ###
	Plug 'ap/vim-css-color'
    Plug 'alvan/vim-closetag'
    " ### Development plugins ###
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'rstacruz/vim-closer'
    " ### Finances ###
    Plug 'ledger/vim-ledger'
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

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets']

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'Cursor'],
"   \ 'bg+':     ['bg', 'Cursor'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Normal'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" ###### Personalized keyboard shortcuts #####

" # Open up terminal at the bottom #
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

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
"Holding down CTRL and using hjkl make the cursor move like in Normal mode
inoremap <C-j> <down>
inoremap <C-k> <up>

"Add CTRL+V to paste from OS Clipboard
inoremap <C-v> <esc>"+pi

"Holding down ALT and using jk moves the full line up or down
inoremap <m-j> <esc>ddpi
inoremap <m-k> <esc>ddkPi

" ### Plugin-specific ###
" # FZF #
nnoremap <C-p> <esc>:Files<CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab-split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
\}
inoremap <C-f> <esc>:Lines<CR>

" # NERDTree #
nnoremap <C-b> <esc>:NERDTreeToggle<CR>
