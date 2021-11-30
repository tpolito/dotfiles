" Config
set number " Enable line numbers
set noswapfile " Disable swap files
set incsearch
set ignorecase " Enable case insensitive search

let mapleader = "'" " Set command key to single-quote

hi NormalFloat cterm=reverse gui=reverse

call plug#begin('~/AppData/Local/nvim/plugged')
" icons
Plug 'ryanoasis/vim-devicons'

" Theme
Plug 'navarasu/onedark.nvim'

" neovim CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" neovim tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" nerdtree
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline'

" vim-jsx-pretty
" ...

call plug#end()
colorscheme onedark

" Remaps
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Coc (need to use nmap for Coc)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-m> :NERDTreeToggle<CR>
