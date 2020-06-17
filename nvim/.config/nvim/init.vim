call plug#begin(stdpath('data') . '/plugged')

" core plugins
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" status line and color scheme
Plug 'itchyny/lightline.vim'
Plug 'srcery-colors/srcery-vim'

" fuzzy search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" rust language support
Plug 'rust-lang/rust.vim'

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

call plug#end()

let g:coc_global_extensions = ['coc-rust-analyzer']

" colorscheme
set termguicolors
set background=dark
colorscheme srcery

" general settings
set cursorline
set hidden
set laststatus=2
set mouse+=a
set number
set nojoinspaces
set scrolloff=7
set signcolumn=yes
set smartindent

set foldlevelstart=2

" tabs are 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4

" spacebar as leader
let mapleader=' '

" save file
nnoremap <leader>w :write<cr>

" edit/source vimrc
nnoremap <leader>ev :edit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<cr>

" easy escape
inoremap jk <esc>

" auto brace
inoremap {<cr> {<cr>}<esc>O

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fuzzy search files/buffers
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

" prev/next coc diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" status line config
let g:lightline = {
    \ 'colorscheme': 'srcery_drk',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified', 'cocstatus']]
    \ },
    \ 'component_function': { 'cocstatus': 'coc#status', 'filename': 'StatusFilename' }
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

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
