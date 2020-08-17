" Plugins {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Language support

Plug 'rust-lang/rust.vim' " Rust
Plug 'cespare/vim-toml'   " TOML

" Visuals

Plug 'itchyny/lightline.vim'    " easily configurable status line
Plug 'ayu-theme/ayu-vim'        " colorscheme
Plug 'srcery-colors/srcery-vim' " colorscheme

" fuzzy search

Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

Plug 'tmsvg/pear-tree'

call plug#end()

" }}}

let g:coc_global_extensions = ['coc-python', 'coc-rust-analyzer']

" colorscheme
set termguicolors
colorscheme srcery

" General settings {{{

set cursorline       " highlight the line that the cursor is on
set hidden           " allow unsaved buffers in the background
set inccommand=split " live preview the effects of a substitute
set laststatus=2     " always show two status lines at the bottom
set mouse=a          " enable mouse support
set nojoinspaces     " insert one space after punctuation
set number           " enable line numbers
set scrolloff=7      " try to keep this many lines above and below the cursor
set signcolumn=yes   " always show the sign column
set smartindent      " intelligent auto-indenting for C-like languages

" }}}

" set foldlevelstart=2

" By default, tabs are 4 spaces

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" spacebar as leader
let mapleader=' '

" easy escape
imap jk <esc>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" save file
nnoremap <leader>w :write<cr>

" edit/source vimrc
nnoremap <leader>ev :edit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<cr>

" fuzzy search files/buffers
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

" prev/next coc diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" lightline config

set noshowmode
let g:lightline = {
    \ 'colorscheme': 'srcery_drk',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified', 'cocstatus']]
    \ },
    \ 'component_function': { 'cocstatus': 'coc#status', 'filename': 'StatusFilename', 'gitbranch': 'FugitiveHead' }
\ }

function! StatusFilename()
    return expand('%')
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <space>o  :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>s  :<C-u>CocFzfList symbols<CR>
nmap <leader>rn <Plug>(coc-rename)

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

command! -nargs=0 Format :call CocAction('format')

let g:pear_tree_repeatable_expand=0
