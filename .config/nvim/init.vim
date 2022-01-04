source ~/.config/nvim/plugin.vim

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set tabstop=4
set shiftwidth=4
set number
syntax enable
set smartindent
set ignorecase
set smartcase
set incsearch
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set wildmode=list:longest
set background=dark
set showtabline=2
set list
set listchars=tab:\▸\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set clipboard+=unnamed
colorscheme iceberg

let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ }
