"===Base Config===

"jump to last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax on

"set indentation rules according to language
filetype plugin indent on

set expandtab
set shiftwidth=2

set ignorecase
set smartcase
set wrap
set autoindent
set smartindent
set copyindent
set number
set title

set undofile
set undolevels=1000
set undoreload=10000

"share vim and system clipboard
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

"scroll and cursor clicking only
"set mouse=ni

"load extra files
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/nerdtree.vim
