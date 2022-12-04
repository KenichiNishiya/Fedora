set nocompatible            " disable compatibility to old-time vi

"call plug#begin('~/.local/share/nvim/plugged')
"
"Plug 'vim-airline/vim-airline'
"Plug 'nvim-treesitter/nvim-treesitter'
"
"call plug#end()

"set cursorline  
"hi CursorLine   cterm=NONE ctermbg=black ctermfg=white
"set cursorcolumn 
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=black  ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=black  ctermfg=NONE "guibg=lightgrey guifg=white
set showmatch               " show matching 
set nohlsearch
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set incsearch               " incremental search
set history=1000
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
"set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" Remap navigation commands to center view on cursor using zz
nnoremap <C-U> 11kzz
nnoremap <C-D> 11jzz
nnoremap j jzz
nnoremap k kzz
nnoremap # #zz
nnoremap * *zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <Up> <Up>zz
nnoremap <Down> <Down>zz

" esc in insert & visual mode
 
inoremap kj <esc>
vnoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>

" Change timeout for esc
set timeoutlen=100

" Stop from auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undodir=~/.config/nvim/undo-dir
set undofile

" Open file on the same line you last closed it
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
