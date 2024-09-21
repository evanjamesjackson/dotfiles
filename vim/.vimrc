syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set smartindent
set ignorecase
set smartcase
set number
set clipboard=unnamedplus
set incsearch
set hlsearch
set noerrorbells
set noswapfile
set updatetime=100
set visualbell
set t_vb=
let mapleader = " "

set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

" Settings for navigating panes
set splitright
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" On startup install any missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
"Plug 'psliwka/vim-smoothie'
Plug 'frazrepo/vim-rainbow'
Plug 'LunarWatcher/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Plugin configurations

" Enable vim-rainbow 
let g:rainbow_active = 1

" GitGutter configuration
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" Maps both CTRL+_ and CTRL+/ to the commenter toggle. For some reason,
" configuring for CTRL+/ alone does not work
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

set background=dark
autocmd vimenter * ++nested colorscheme nord
" Required for transparent background
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
