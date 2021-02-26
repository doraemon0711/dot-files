" ---------------------------------------------------------------
" Maintainer: Tobias Johansson (TobiasDev)
" Repo: https://github.com/TobiasDev/dot-files
" Nvim version: 0.5
" Version: 0.2.2
" Changes: Adding VimWiki
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
    " Style
    " ---
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline-themes'
    " ---
    " File-explorer
    " ---
    Plug 'scrooloose/nerdtree'
    " ---
    " Language server
    " ---
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
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
    " Telescope
    " ---
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " ---
    " Development
    " ---
    Plug 'godlygeek/tabular'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'townk/vim-autoclose'
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
colorscheme   nord
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
" neovim/nvim-lspconfig
" ---


" ---
" neoclide/coc.nvim
" ---
" let g:coc_global_extensions         = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" ---
" vim-airline/vim-airline
" ---
let g:airline_theme                 = 'nord'
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
" Setting SPACEBAR to be 'Leader' key
let mapleader=" "
noremap <Space> <Nop>
" -----------------------------
" NORMAL MODE
" -----------------------------
" Movement changes
nnoremap <C-h> <esc>10h
nnoremap <C-l> <esc>10l
nnoremap <C-j> <esc>10j
nnoremap <C-k> <esc>10k

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
nnoremap <Leader>c <esc>:ColorizerToggle<CR>

" ---
" Telescope
" ---
nnoremap <C-g> <esc>:Telescope live_grep<CR>
nnoremap <C-o> <esc>:Telescope oldfiles<CR>
nnoremap <C-p> <esc>:Telescope find_files<CR>

" ---
" FZF - TESTING TELESCOPE AS AN ALTERNATIVE
" ---
" nnoremap <C-g> <esc>:Lines<CR>
" nnoremap <C-o> <esc>:History<CR>
" nnoremap <C-p> <esc>:Files<CR>

" ---
" NERDTree
" ---
nnoremap <Leader>b <esc>:NERDTreeToggle<CR>
nnoremap <Leader>v <esc>:NERDTreeFind<CR>

" ---
" VimWiki
" ---
nnoremap <Leader>d <esc>:VimwikiToggleListItem<CR>

" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" TEMPORARY REMOVED TO TEST BUILT-IN LSP
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" ---
" neoclide/coc.nvim
" ---

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
" -----------------------------
