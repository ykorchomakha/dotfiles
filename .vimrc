syntax on

set nu rnu

set tabstop=4
set softtabstop=4
set autoindent
set expandtab
set shiftwidth=4
set smartindent

set nowrap
set colorcolumn=100

set nohlsearch
set incsearch

set list lcs=tab:›⋅,trail:⋅,space:⋅

set cursorline

set clipboard=unnamedplus

set noswapfile
set nobackup
set undofile

set scrolloff=8
set signcolumn=yes

set termguicolors

if !has('nvim')
    colorscheme habamax
    set undodir=$HOME/.vim/undodir
endif

