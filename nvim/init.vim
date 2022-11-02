" Plugins
"
call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'romgrk/barbar.nvim'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'fcpg/vim-farout'
Plug 'ajmwagar/vim-deus'
Plug 'whatyouhide/vim-gotham'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'vim-syntastic/syntastic'
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'nelsyeung/twig.vim'
Plug 'dolfly/plantuml'
Plug 'aklt/plantuml-syntax'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()


" General settings
"
set encoding=utf-8
set history=500
set hidden
set incsearch 
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmenu
set lazyredraw
set noerrorbells
set novisualbell
set timeoutlen=500
set foldcolumn=1
set cursorcolumn cursorline
set splitbelow splitright
set number relativenumber
set linebreak wrap
set noshowmode noshowcmd
set mouse=


" Colors
" 
if (has('termguicolors'))
  set termguicolors
endif

colorscheme farout

let g:lightline = {
      \ 'colorscheme': 'farout',
      \ }

let g:startify_custom_header =
      \ startify#pad(split(system('figlet -f DOS\ Rebel neovim'), '\n'))

let g:chadtree_settings = {
      \ 'theme.text_colour_set': 'nord',
      \ }


" Providers
"
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Keybindings
" 
" Leader keys
"
let mapleader = ","
let maplocalleader = ";"

" Open CHADTree
"
nmap <leader>v :CHADopen<cr>

" Quick save
"
nmap <leader>, :w!<cr>

" Quick escape
"
inoremap jk <esc>

" Navigate panes
"
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Navigate buffers
"
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>d :bdelete<cr>

" Navigate tabs
"
map <leader>n :tabnew<cr>
map <leader>j :tabnext<cr>
map <leader>k :tabprevious<cr>

" Move selected text
"
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Add new line at cursor
"
nnoremap <expr>K getline('.')[col('.')-1] == ' ' ? "r<cr>" : "i<cr><esc>"

" Add empty line below
"
nmap <leader>b o<esc>k

" Add empty line above
"
nmap <leader>a O<esc>j

" Clear search string
"
nmap <silent><leader> :let @/= ""<cr>

" Comments
"
" Bash/Python
map <leader>bc I# <esc>^

" C(SS)
map <leader>cs I/* <esc>A*/<esc>^

" C
map <leader>cc I// <esc>^


" Spawn terminals
"
" Vertical split
"
nmap <silent><leader>vt :vs +term<cr>a

" Horizontal split
"
nmap <silent><leader>st :sp +term<cr>a

" Leave terminal mode
"
tnoremap <esc> <c-\><c-n>

" External config files
"
source $HOME/.config/nvim/bufferline.vim
source $HOME/.config/nvim/treesitter.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/leap.vim
source $HOME/.config/nvim/vimtex.vim
