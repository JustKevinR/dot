"Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'junegunn/goyo.vim'
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'airblade/vim-gitgutter/'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
" Color-schemes
    Plug 'morhetz/gruvbox' 
call plug#end() 
 
"General Settings
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic number
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup 

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Key-bindings
let mapleader=" "
nnoremap <leader>n :Explore<CR> 
nnoremap <leader><ENTER> :Goyo<CR>

"move lines
xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv

"Resize split
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap Q <nop>

"Moving
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"Color Set
colorscheme gruvbox
set background=dark cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    CocEnable
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

