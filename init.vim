syntax on

set mouse=a
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu 
set foldlevelstart=99

syntax enable
set scrolloff=7

call plug#begin('~/.config/nvim/autoload/')

"Colour scheme
Plug 'dracula/vim', { 'as': 'dracula' }

"C/C++ dev plugins
Plug 'ycm-core/YouCompleteMe'

"Syntax plugin
Plug 'vim-syntastic/syntastic'

"Autocomplete plugin
Plug 'neoclide/coc.nvim'

"Nav plugins
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim.git'

"Comment Plugin
Plug 'preservim/nerdcommenter'

"Auto-format plugin
Plug 'sbdchd/neoformat'

"Code folding
Plug 'tmhedberg/SimpylFold'

call plug#end()

"Aesthetic? Maybe
colorscheme dracula

"Definitions
"<leader>d: go to definition
"K check documentation of class or method
"<leader>n: show the usage of a name in current file
"<leader>r: rename a name

"Code checker
"let g:neomake_python_enabled_makers = ['flake8']
"call neomake#configure#automake('nrwi', 500)

set encoding=UTF-8
let mapleader = " "
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | :vertical resize 60 | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"Allow NERDTree to show hidden files"
let NERDTreeShowHidden=1
let g:python3_host_prog='/usr/bin/python3'

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" enable line numbers
let NERDTreeShowLineNumbers=1

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

" Use CTRL+c to copy to system clipboard
noremap <C-c> "+y e
