call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dylanaraps/wal.vim'
call plug#end()

colorscheme wal

command! -nargs=0 Sw w !doas tee % > /dev/null

set number
set tabstop=4
set shiftwidth=4
set expandtab
