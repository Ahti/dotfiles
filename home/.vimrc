source ~/.vim/bundle.vim

set mouse=a " use the mouse, luke
set history=700 " keep 700 lines of command history

set incsearch
set ignorecase
set smartcase

" use 256 colors
set t_Co=256

" highlight search results
set hlsearch
hi Search ctermbg=54
" display line numbers
set number
set ruler
"hightlight cursor line
set cursorline
set background=dark
syntax enable
colorscheme solarized

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" respect modeline settings
set modeline

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

imap jj <Esc>
map ; :

" open new splits right and bottom
set splitbelow
set splitright

