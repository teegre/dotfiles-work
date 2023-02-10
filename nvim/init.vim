" Plugins
"
call plug#begin('~/.config/nvim/plugged')

Plug 'DaikyXendo/nvim-material-icon'
Plug 'ajmwagar/vim-deus'
Plug 'aklt/plantuml-syntax'
Plug 'dolfly/plantuml'
Plug 'fcpg/vim-farout'
Plug 'ggandor/leap.nvim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'mhinz/vim-startify'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" Plug 'nelsyeung/twig.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'puremourning/vimspector'
Plug 'rest-nvim/rest.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'samjwill/nvim-unception'
Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }
Plug 'tamton-aquib/duck.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-syntastic/syntastic'
Plug 'wadackel/vim-dogrun'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'whatyouhide/vim-gotham'

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

set background=dark

colorscheme spaceduck

let g:lightline = {
      \ 'colorscheme': 'spaceduck',
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

" No neck pain
nnoremap <silent><localleader>n :NoNeckPain<cr>

" PlantUML previewer
nnoremap <silent><localleader>p :PlantumlOpen<cr>

nnoremap <silent><localleader>r <Plug>RestNvim<cr>
nnoremap <silent><localleader>rr <Plug>RestNvimLast<cr>

" Duck
"
nnoremap <silent><localleader>dc :lua require('duck').hatch('🐈', 5)<cr>
nnoremap <silent><localleader>dd :lua require('duck').hatch('🦆',10)<cr>
nnoremap <silent><localleader>ds :lua require('duck').hatch('🍓', 5)<cr>
nnoremap <silent><localleader>dh :lua require('duck').hatch('🍯', 5)<cr>

" Spawn terminals
"
" Vertical split
"
nmap <silent><leader>vt :vs +term<cr>:set nonu nornu<cr>a

" Horizontal split
"
nmap <silent><leader>st :sp +term<cr>:set nonu nornu<cr>a

" Leave terminal mode
"
tnoremap <esc> <c-\><c-n>

" External config files
"
source  $HOME/.config/nvim/bufferline.vim
source  $HOME/.config/nvim/treesitter.vim
source  $HOME/.config/nvim/coc.vim
source  $HOME/.config/nvim/vimspector.vim
source  $HOME/.config/nvim/leap.vim
source  $HOME/.config/nvim/vimtex.vim
source  $HOME/.config/nvim/rest-nvim.vim
runtime $HOME/.config/nvim/nvim-material-icon.lua
