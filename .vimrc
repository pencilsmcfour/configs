" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

colorscheme evening
