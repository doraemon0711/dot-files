" ---------------------------------------------------------------
" Maintainer: Tobias Johansson (TobiasDev)
" Repo: https://github.com/TobiasDev/dot-files
" NeoVim: ^0.5
" Version: 0.8
" Changes: Moving over to Molokai theme
" Windows: C:\Users\USERNAME\AppData\Local\nvim\
" Linux: .config\nvim\
" ---------------------------------------------------------------

" ---------------------------------------------------------------
" HOST - Windows 10 specific
" ---------------------------------------------------------------
let g:python3_host_prog = 'C:\Python38\python.exe'

" ---------------------------------------------------------------
" PLUGINS
" ---------------------------------------------------------------
" Check if we have VimPlug installed
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

" Directory where plugins will be stored
call plug#begin('~/.nvim/plugged')
" ---
" Style
" ---
    Plug 'tomasr/molokai'
    Plug 'vim-airline/vim-airline-themes'
" ---
" File-explorer
" ---
    Plug 'scrooloose/nerdtree'
" ---
" Vim helpers
" ---
    Plug 'vim-airline/vim-airline'
" ---
" Better git in VIM
" ---
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
" ---
" Faster search and find
" ---
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
" ---
" Development
" ---
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'townk/vim-autoclose'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'calviken/vim-gdscript3'
" ---
" Writing
" ---
    Plug 'plasticboy/vim-markdown'
    Plug 'vimwiki/vimwiki'
call plug#end()

" ---------------------------------------------------------------
" CONFIGURATION
" ---------------------------------------------------------------
syntax        enable
colorscheme   molokai
set           background=dark
set           termguicolors
set           encoding=utf-8
set           fileencoding=utf-8
set           termencoding=utf-8
set           signcolumn=yes
set           updatetime=300
set           number
set           wrap
set           linebreak
set           cursorline
set           guifont=Fira\ Code:h11
"Change TAB to be similar to VS Code
set           tabstop=4
set           shiftwidth=4
set           expandtab

" -----------------------------
" PLUGIN SPECIFIC CONFIGURATION
"------------------------------
" ---
" plasticboy/vim-markdown
" ---
let g:vim_markdown_folding_disabled = 1

" ---
" COC
" ---
let g:coc_global_extensions = ['coc-godot']

" ---
" vim-airline/vim-airline
" ---
let g:airline_theme                 = 'molokai'
let g:airline_section_a             = airline#section#create(['mode'])
let g:airline_section_b             = airline#section#create(['hunks', 'branch'])
let g:airline_section_c             = airline#section#create(['%F'])
let g:airline_section_x             = airline#section#create([])
let g:airline_section_y             = airline#section#create(['%Y'])
let g:airline_section_z             = airline#section#create(['%l', '/', '%L'])

" ---------------------------------------------------------------
" Keyboard shortcuts
" ---------------------------------------------------------------
" -----------------------------
" ALL MODES
" -----------------------------
" Setting SPACEBAR to be 'Leader'
let mapleader=" "
noremap <Space> <Nop>

" -----------------------------
" NORMAL MODE
" -----------------------------
" Jump between splits easy
nnoremap <S-h> <esc><C-w>h
nnoremap <S-l> <esc><C-w>l

nnoremap <Leader>h <esc><C-w>R
nnoremap <Leader>l <esc><C-w>r
nnoremap <Leader>j <esc><C-w>10>
nnoremap <Leader>k <esc><C-w>10<

" Holding down ALT and using jk moves the full line up or down
nnoremap <M-j> <esc>ddp
nnoremap <M-k> <esc>ddkP

" Go between diffs
nnoremap <M-l> <esc>]c
nnoremap <M-h> <esc>[c

" Quick comment out
nnoremap <Leader>c :Commentary<cr>

" Open a new split
nnoremap <Leader>s <esc>:vs<cr>

" -----------------------------
" INSERT MODE
" -----------------------------
" Add CTRL+V to paste from OS Clipboard
inoremap <C-v> <esc>"+pi

" Holding down CTRL and using hjkl make the cursor move like in Normal mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" Holding down ALT and using jk moves the full line up or down
inoremap <M-j> <esc>ddpi
inoremap <M-k> <esc>ddkPi

" -----------------------------
" VISUAL MODE
" -----------------------------
" Adds the 'standard' copy and paste behaviour
vnoremap <C-c> "+y


" Quick comment out
vnoremap <Leader>c :Commentary<cr>

" -----------------------------
" Plugin-specific
" -----------------------------

" ---
" NERDTree
" ---
nnoremap <Leader>b <esc>:NERDTreeToggle<CR>
nnoremap <Leader>v <esc>:NERDTreeFind<CR>

" ---
" FZF
" ---
nnoremap <C-f> <esc>:Rg<CR>
nnoremap <C-g> <esc>:BLines<CR>
nnoremap <C-o> <esc>:History<CR>
nnoremap <C-p> <esc>:Files<CR>

" ---
" COC
" ---
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
