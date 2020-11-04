" ---------------------------------------------------------------
" Maintainer: Tobias Johansson (TobiasDev)
" Repo: https://github.com/TobiasDev/dot-files
" Version: 0.8.1
" Changes: A lot of keyboard shortcut changes
" Location, Windows: C:\Users\USERNAME\AppData\Local\nvim\
" Location, Linux: .config\nvim\
" TODO
" - Once I'm on neovim 0.5, install this https://github.com/nvim-lua/telescope.nvim
" - https://github.com/norcalli/snippets.nvim
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
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdtree'
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
    Plug 'alvan/vim-closetag'
    " ---
    " Development plugins
    " ---
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'townk/vim-autoclose'
    Plug 'godlygeek/tabular'
    Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" ---------------------------------------------------------------
" CONFIGURATION
" ---------------------------------------------------------------
syntax        enable
colorscheme   relaxed-solarized
set           termguicolors
set           updatetime=300
set           encoding=utf-8
set           signcolumn=yes
set           number
set           wrap
set           linebreak
set           cursorline
set           noshowmode
set           nobackup
"Change TAB to be similar to VS Code
set           tabstop=4
set           shiftwidth=4
set           expandtab

" -----------------------------
" PLUGIN SPECIFIC CONFIGURATION
" -----------------------------
" ---
" plasticboy/vim-markdown
" ---
let g:vim_markdown_folding_disabled=1

" ---
" neoclide/coc.nvim
" ---
let g:coc_global_extensions         = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" ---
" vim-airline/vim-airline
" ---
let g:airline_theme                 = 'airline_relaxed_solarized'
let g:airline_section_a             = airline#section#create(['mode'])
let g:airline_section_b             = airline#section#create(['hunks', 'branch'])
let g:airline_section_x             = airline#section#create([])
let g:airline_section_y             = airline#section#create(['%Y'])
let g:airline_section_z             = airline#section#create(['%l', '/', '%L'])

" ---
" junegunn/fzf
" ---
" Currently not working in Windows
let g:fzf_colors =
\ { 'fg':      ['fg', 'Menu'],
  \ 'bg':      ['bg', 'Menu'] }

" ---------------------------------------------------------------
" Keyboard shortcuts
" ---------------------------------------------------------------
" -----------------------------
" ALL MODES
" -----------------------------
" // Currently I have no shortcuts added to work in all modes
" -----------------------------
" NORMAL MODE
" -----------------------------
nnoremap <C-s> <esc>:w!<enter>
nnoremap <C-d> <esc>daw

" Movement changes
" nnoremap <C-h> <esc>10h
" nnoremap <C-l> <esc>10l
" nnoremap <C-j> <esc>10j
" nnoremap <C-k> <esc>10k

" Jump between splits
nnoremap <Tab> <esc><C-w>w
nnoremap <S-h> <esc><C-w>h
nnoremap <S-l> <esc><C-w>l

" Jump between diffs
nnoremap <S-j> <esc>]c
nnoremap <S-k> <esc>[c

" Holding down ALT and using jk moves the full line up or down
nnoremap <M-j> <esc>ddp
nnoremap <M-k> <esc>ddkP

" Move split left or right with ALT+hl
nnoremap <M-h> <esc><c-w>R
nnoremap <M-l> <esc><c-w>r

" Close Nvim
nnoremap <M-q> <esc>:q<cr>

" Create a new split
nnoremap <M-s> <esc>:vs<cr>

" Quick comment out
nnoremap <M-c> :Commentary<cr>

" -----------------------------
" INSERT MODE
" -----------------------------
" Holding down CTRL and using hjkl make the cursor move like in Normal mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" Add CTRL+V to paste from OS Clipboard
inoremap <C-v> <esc>"+pi

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

vnoremap <M-c> :Commentary<cr>
" -----------------------------
" Plugin-specific
" -----------------------------
" ---
" norcalli/nvim-colorizer
" ---
nnoremap <S-c> <esc>:ColorizerToggle<CR>

" ---
" FZF
" ---
noremap <C-f> <esc>:Lines<CR>
noremap <C-o> <esc>:History<CR>
nnoremap <C-p> <esc>:Files<CR>
let g:fzf_action = {
    \ 'ctrl-v': 'vsplit'
\}

" ---
" NERDTree
" ---
nnoremap <C-b> <esc>:NERDTreeToggle<CR>
" nnoremap <C-v> <esc>:NERDTreeFind<CR>

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
