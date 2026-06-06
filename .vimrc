" == Appearance ========================================

" color scheme
colorscheme gruvbox

" font
set guifont=Consolas:h13:cANSI:qDRAFT
set encoding=utf8

" cursor
set guicursor=n-v:block-lCursor
set guicursor+=c-i:ver20-Cursor
let &t_SI = "\e[2 q"
let &t_EI = "\e[2 q"

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" spacing
set nowrap
set scrolloff=10
set shiftwidth=4
set tabstop=4
set expandtab

" auto indent
set ai

" smart indent
set si

" show matching brackets when text indicator is over them
set showmatch

" always show the status line
set laststatus=2

" relative line numbers
set nu rnu

" highlighting
set hlsearch
filetype plugin indent on
syntax on

" custom syntax highlighting
augroup custom_c_syntax
    autocmd!
    autocmd FileType c,cpp syntax keyword cType u8 u16 u32 u64 i8 i16 i32 i64 b8 b16 b32 b64 f32 f64 function exposed_function
augroup end


" == General ===========================================

" no annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" no backups
set nobackup
set nowb
set noswapfile

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" == Plugins ===========================================



" == Remappings ========================================

" mouse clicks
set mouse=a
set mousemodel=extend
nnoremap <LeftMouse> <LeftMouse>
inoremap <LeftMouse> <Esc><LeftMouse>

" set leader key
let mapleader=" "

" open vimrc
nnoremap <leader>rc :tabedit $MYVIMRC<cr>

" movement
set backspace=2
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" cycle tabs
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left>  :tabprevious<CR>

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" compile
function! Build()
    let l:root = findfile('build.bat', expand('%:p:h') . ';')
    let l:root = fnamemodify(l:root, ':p:h')
    if !empty(l:root)
        let l:old_makeprg = &makeprg
        let &makeprg = l:root . '\build.bat'
        silent make!
        let &makeprg = l:old_makeprg
        copen
    else
        echoerr "Could not find build.bat"
    endif
endfunction

map <C-S-b> :call Build()<cr>

" run project
let g:project_exe = "main.exe"
function! Run()
    let l:root = findfile('build.bat', expand('%:p:h') . ';')
    let l:root = fnamemodify(l:root, ':p:h')
    if !empty(l:root)
        let l:exe_path = l:root . '\build\' . g:project_exe
        if filereadable(l:exe_path)
            execute 
            let l:old_makeprg = &makeprg
            let &makeprg = '"' . l:exe_path . '"'
            silent make!
            let &makeprg = l:old_makeprg
            copen
        else
            echoerr "Executable not found: " . l:exe_path
        endif
    endif
endfunction

map <F5> :call Run()<cr>

" open/close the quickfix window
nnoremap <leader>qo :copen<cr>
nnoremap <leader>qf :cclose<cr>

" generate divider comment
function! FormatDivider()
    let l:line = getline('.')

    " 1. Remove the comment wrapper and any existing '=' signs or extra spaces
    let l:title = substitute(l:line, '^\/\*==\s*', '', '')       " Strip leading /*==
    let l:title = substitute(l:title, '\s*=\s*\*\/$', '', '')   " Strip trailing ==*/ and =
    let l:title = substitute(l:title, '=', '', 'g')             " Strip any stray = signs
    let l:title = substitute(l:title, '^\s*\(.\{-}\)\s*$', '\1', '') " Trim leading/trailing spaces

    " 2. Calculate correct padding length
    " '/*== ' (5) + title + ' ' (1) + '==*/' (5) = 11 base characters
    let l:base_len = 11 + strlen(l:title)
    let l:pad_len = 60 - l:base_len
    
    " 3. Rebuild the line flawlessly
    if l:pad_len >= 0
        let l:padding = repeat('=', l:pad_len)
        let l:new_line = '/*== ' . l:title . ' ' . l:padding . '==*/'
        call setline('.', l:new_line)
    endif
endfunction

map <leader>gd :call FormatDivider()<cr>

" generate header guards
function! InsertHeaderGuard()
    " 1. Get the filename without the path (e.g., 'program.h')
    let l:filename = expand('%:t')
    
    " 2. Convert to uppercase and replace dots/dashes with underscores (e.g., 'PROGRAM_H')
    let l:guard = toupper(substitute(l:filename, '[\.-]', '_', 'g'))
    
    " 3. Define the template lines
    let l:lines = [
        \ '#ifndef ' . l:guard,
        \ '#define ' . l:guard,
        \ '',
        \ '',
        \ '#endif // ' . l:guard
        \ ]
    
    " 4. Write the lines to the empty buffer
    call setline(1, l:lines)
    
    " 5. Position the cursor on line 3 (the empty space inside the guard)
    call cursor(3, 1)
endfunction

augroup HeaderGuards
    autocmd!
    autocmd BufNewFile *.h call InsertHeaderGuard()
augroup END


