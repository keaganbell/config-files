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
nnoremap <leader>e :Files<Cr>
nnoremap <leader>b :Buffer<Cr>
nnoremap <leader>q :Ex<Cr>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
