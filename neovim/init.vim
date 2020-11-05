" ---------------------------------------------------------------
" Maintainer: Tobias Johansson (TobiasDev)
" Repo: https://github.com/TobiasDev/dot-files
" Nvim version: 0.5
" Version: 0.1.0
" Changes: "Reset" my config file for moving over to Neovim 0.5
" Location, Windows: C:\Users\USERNAME\AppData\Local\nvim\
" Location, Linux: .config\nvim\
" TODO
" // Before adding these I should get LSP working
" - Plugins to install:
"   - https://github.com/nvim-lua/telescope.nvim
"   - https://github.com/norcalli/snippets.nvim
" ---------------------------------------------------------------

" ---------------------------------------------------------------
" HOST - Windows 10 specific
" ---------------------------------------------------------------
" let g:python3_host_prog = 'C:\Python38\python.exe'

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

" Specify a directory for plugins
call plug#begin('~/.nvim/plugged')
    " ---
    " Vim helpers
    " ---
    " Plug 'vim-airline/vim-airline'
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
    " Development plugins
    " ---
    Plug 'godlygeek/tabular'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'townk/vim-autoclose'
call plug#end()

" ---------------------------------------------------------------
" CONFIGURATION
" ---------------------------------------------------------------
syntax        enable
colorscheme   relaxed-solarized
set           termguicolors
set           encoding=utf-8
set           signcolumn=yes
set           number
set           wrap
set           linebreak
set           cursorline
"Change TAB to be similar to VS Code
set           tabstop=4
set           shiftwidth=4
set           expandtab

" -----------------------------
" PLUGIN SPECIFIC CONFIGURATION
" -----------------------------

" ---
" vim-airline/vim-airline
" ---
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
" let g:airline_detect_modified=1

" let g:airline_theme                 = 'airline_relaxed_solarized'
" let g:airline_section_a             = airline#section#create(['mode'])
" let g:airline_section_b             = airline#section#create(['hunks', 'branch'])
" let g:airline_section_c             = airline#section#create(['%t'])
" let g:airline_section_x             = airline#section#create([])
" let g:airline_section_y             = airline#section#create(['%Y'])
" let g:airline_section_z             = airline#section#create(['%l', '/', '%L'])

" ---------------------------------------------------------------
" Keyboard shortcuts
" ---------------------------------------------------------------
" -----------------------------
" ALL MODES
" -----------------------------
" Setting SPACEBAR to be 'Leader' key
let mapleader=" "
noremap <Space> <Nop>
" -----------------------------
" NORMAL MODE
" -----------------------------
nnoremap <C-s> <esc>:w!<enter>

" Movement changes
nnoremap <C-h> <esc>10h
nnoremap <C-l> <esc>10l
nnoremap <C-j> <esc>10j
nnoremap <C-k> <esc>10k

" Jump between splits easy
nnoremap <S-h> <esc><C-w>h
nnoremap <S-l> <esc><C-w>l

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
" Adds the "standard" copy and paste behaviour
vnoremap <C-c> "+y

" Movement changes
vnoremap <C-h> 10h
vnoremap <C-l> 10l
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" Quick comment out
vnoremap <Leader>c :Commentary<cr>

" -----------------------------
" Plugin-specific
" -----------------------------
" ---
" norcalli/nvim-colorizer
" ---
" nnoremap <S-c> <esc>:ColorizerToggle<CR>

" ---
" FZF
" ---
nnoremap <C-g> <esc>:Lines<CR>
nnoremap <C-o> <esc>:History<CR>
nnoremap <C-p> <esc>:Files<CR>
