" explicitly specify the use of vim over vi
set nocompatible


" editor customizations !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
set nu rnu
set nowrap
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
let &t_ut=''

" make fzf appear in window
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" remappings !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
let mapleader=" "
nnoremap <leader><leader> :noh<Cr>
nnoremap <leader>ee :Files<Cr>
nnoremap <leader>bb :Buffer<Cr>
nnoremap <leader>qq :Ex<Cr>

" building code
nnoremap <leader>bl :term<Cr>./linux-debug-build.sh<Cr>
nnoremap <leader>bw :term<Cr>./win64-debug-build.sh<Cr>
nnoremap <leader>cl :term<Cr>./linux-debug-clean.sh<Cr>
nnoremap <leader>cw :term<Cr>./win64-debug-clean.sh<Cr>
nnoremap <leader>mm :make<Cr>
nnoremap <leader>ma :term<Cr>make all<Cr>
nnoremap <leader>mh :term<Cr>make libgame.so<Cr>
nnoremap <leader>mr :make<Cr>:!(./run)<Cr>
nnoremap <leader>rr :!(./run)<Cr>

" window manipulation
nnoremap <leader>qv :vsp .<Cr>
nnoremap <leader>qs :sp .<Cr>
nnoremap <leader>tt :term<Cr>
nnoremap <leader>L 5<C-w>>
nnoremap <leader>H 5<C-w><
nnoremap <leader>J 5<C-w>-
nnoremap <leader>K 5<C-w>+

" movement
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
