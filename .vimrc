" explicitly specify the use of vim over vi
set nocompatible


" editor customizations !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
set nu rnu
set hlsearch
set scrolloff=10
set shiftwidth=4
set tabstop=4
set expandtab
filetype on
filetype plugin on
filetype indent on
syntax on


" plugins !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
call plug#begin()
" gruvbox theme
Plug 'morhetz/gruvbox'
" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" choose theme
set background=dark
colorscheme gruvbox

" make fzf appear in window
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" remappings !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
let mapleader=" "
nnoremap <leader>qq :Ex<Cr>
nnoremap <leader>ee :Files<Cr>
nnoremap <leader>bb :Buffer<Cr>
nnoremap <leader><leader> :noh<Cr>
nnoremap <leader>mm :make<Cr>
nnoremap <leader>mr :make<Cr>:!(./run)<Cr>
nnoremap <leader>rr :!(./run)<Cr>
" movement
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
