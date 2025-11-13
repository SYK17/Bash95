" Set color scheme
colorscheme 256_noir

" Cursor line highlight and change on Insert mode
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

" Enable filetype plugins, indent and syntax
filetype plugin indent on
syntax enable

" Python flake8 integration:
" Map F7 key in python buffers to run flake8 once per buffer
autocmd FileType python nnoremap <buffer> <F7> :call flake8#Flake8()<CR>
" Run flake8 automatically on Python file save
autocmd BufWritePost *.py call flake8#Flake8()

" Indentation settings for 4 spaces instead of tabs
set expandtab       " Use spaces when pressing Tab
set tabstop=4       " Tab character width displayed as 4 spaces
set shiftwidth=4    " Number of spaces per indentation level
set softtabstop=4   " Number of spaces for Tab keypress in insert mode
set autoindent      " Copy indent from previous line
set smartindent     " Smart auto-indent for C-like programs (also works well with Python)

" Optional: line numbers and scroll settings to improve usability
set number          " Show absolute line numbers
set relativenumber  " Show relative line numbers for easier navigation
set cursorline      " Highlight current line
set clipboard=unnamedplus " Use system clipboard

" Hybrid line numbers on in N-mode and off in I-mode
set number
augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,           * if &nu                  | set nornu | endif
augroup END" Toggle line numbers

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
vnoremap G G$

" Save & reuse undo history
set undofile

" Highlight matching brackets
set showmatch

call plug#begin()

" List plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
" Plug 'gosukiwi/vim-smartpairs'

call plug#end()

" --- Match fzf popup colors to Vim ---
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

let $FZF_PREVIEW_COMMAND = 'bat --style=numbers --color=always --theme=AllBlack --line-range :500 {}'
