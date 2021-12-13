" base settings
syntax on
set number
set noswapfile
set relativenumber
set ignorecase
set nocompatible
set shiftwidth=4
set expandtab
set scrolloff=8
set updatetime=300
set tabstop=4
set smartindent
set autoindent
set clipboard+=unnamedplus

let mapleader = "'"

call plug#begin('~/AppData/Local/nvim/plugged')
    " Theme + Bar
    Plug 'navarasu/onedark.nvim'
    Plug 'vim-airline/vim-airline'
    
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip' " A snip engine is required to use completion engine
    Plug 'saadparwaiz1/cmp_luasnip'
 
    " Plug 'tzachar/cmp-tabnine', { 'do': './install.sh'} " Linux & mac
    Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' } " Windows

    Plug 'windwp/nvim-autopairs'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

colorscheme onedark

" Telescope Remaps
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>F <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

lua << EOF
require('lsp')
require('nvim-autopairs').setup{}
EOF
