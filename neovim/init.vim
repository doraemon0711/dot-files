" ---------------------------------------------------------------
" Maintainer: Tobias Johansson (TobiasDev)
" Repo: https://github.com/TobiasDev/dot-files
" Version: 0.6.0
" Changes: Replacing NERDTree with ChadTree
" Location, Windows: C:\Users\USERNAME\AppData\Local\nvim\
" Location, Linux: .config\nvim\
"
" Commands to remember
" :ls - Shows all the last buffers (for if you accidently close one)
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

" Specify a directory for plugins
call plug#begin('~/.nvim/plugged')
    " ---
    " Vim helpers
    " ---
    Plug 'vim-airline/vim-airline'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
    " ---
    " Faster search and find
    " ---
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " ---
    " Markdown
    " ---
    Plug 'plasticboy/vim-markdown'
    " ---
    " Better git in VIM
    " ---
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    " ---
    " Game-Development plugins
    " ---
    Plug 'habamax/vim-godot'
    " ---
    " Web-Development plugins
    " ---
    Plug 'ap/vim-css-color'
    Plug 'alvan/vim-closetag'
    " ---
    " Development plugins
    " ---
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'townk/vim-autoclose'
    Plug 'godlygeek/tabular'
call plug#end()

" ---------------------------------------------------------------
" CONFIGURATION
" ---------------------------------------------------------------
syntax        enable
colorscheme   relaxed-dark
set           encoding=utf-8
set           cursorline
set           number
set           noshowmode
set           nobackup
"Change TAB to be similar to VS Code since most other people I work with use that
set           tabstop=4
set           shiftwidth=4
set           expandtab
"If possible the terminal will use the colors from "Relaxed Dark"
set           termguicolors

" -----------------------------
" PLUGIN SPECIFIC CONFIGURATION
" -----------------------------
" ---
" plasticboy/vim-markdown
" ---
let g:vim_markdown_folding_disabled = 1
" ---
" neoclide/coc.nvim
" ---
let g:coc_global_extensions         = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" ---
" vim-airline/vim-airline
" ---
let g:airline_theme                 = 'airline_relaxed_dark'
let g:airline_section_a             = airline#section#create(['mode'])
let g:airline_section_b             = airline#section#create(['hunks', 'branch'])
let g:airline_section_x             = airline#section#create([])
let g:airline_section_y             = airline#section#create(['%Y'])
let g:airline_section_z             = airline#section#create(['%l', '/', '%L'])

" ---------------------------------------------------------------
" Keyboard shortcuts
" ---------------------------------------------------------------
" Opens up terminal at the bottom
set splitbelow
" 1. Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" 2. Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
    split term://bash
    resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

" -----------------------------
" ALL MODES
" -----------------------------
" Save
noremap <C-s> <esc>:w<enter>

" -----------------------------
" NORMAL MODE
" -----------------------------
" Movement changes
nnoremap <C-h> <esc>0
nnoremap <C-l> <esc>$
nnoremap <C-j> <esc>10j
nnoremap <C-k> <esc>10k

" Holding down ALT and using jk moves the full line up or down
nnoremap <m-j> <esc>ddp
nnoremap <m-k> <esc>ddkP

" Add so paste comes from the OS Clipboard
nnoremap <C-v> <esc>"+p

" Close Nvim
nnoremap <m-q> <esc>:q<cr>

nnoremap <m-s> <esc>:vs<cr>
" Jump between splits with ALT+hl
nnoremap <m-h> <c-w><c-h>
nnoremap <m-l> <c-w><c-l>

" Quick comment out
nnoremap <m-c> :Commentary<cr>

" -----------------------------
" INSERT MODE
" -----------------------------
" Holding down CTRL and using hjkl make the cursor move like in Normal mode
inoremap <C-j> <down>
inoremap <C-k> <up>

" Add CTRL+V to paste from OS Clipboard
inoremap <C-v> <esc>"+pi

" Holding down ALT and using jk moves the full line up or down
inoremap <m-j> <esc>ddpi
inoremap <m-k> <esc>ddkPi

" -----------------------------
" VISUAL MODE
" -----------------------------
" Adds the "standard" copy and paste behaviour
vnoremap <C-c> "+y
vnoremap <C-v> "+p

vnoremap <C-j> 15j
vnoremap <C-k> 15k

" -----------------------------
" Plugin-specific
" -----------------------------
" ---
" FZF
" ---
nnoremap <C-p> <esc>:Files<CR>
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
\}
inoremap <C-f> <esc>:Lines<CR>

" ---
" CHADTree
" ---
nnoremap <C-b> <esc>:CHADopen<CR>

" ---
" COC
" ---
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
