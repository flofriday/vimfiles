" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

"set backup             " keep a backup file (restore to previous version)
"set undofile           " keep an undo file (undo changes after closing)
"set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-Uon

" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" PERSONAL EDITS STARTS HERE 
" -----------------------------------------

"Allwas the english language
language messages en

"Highlight current line
set cursorline

"Set relativ numbers
set number
set relativenumber

"Disable bell
set belloff=all

"Set working directory automatically to the current file
autocmd BufEnter * silent! lcd %:p:h

"Setup plugins via vim-plug
call plug#begin('~vim/plugged')
"Colors
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'sheerun/vim-wombat-scheme'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-dark'

"Functions
Plug 'scrooloose/nerdtree'
"Plug 'kien/ctrlp.vim'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'taohex/lightline-buffer'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Add a color theme 
if has('gui_running')
	set background=dark
	"colorscheme monokai
	colorscheme space-vim-dark
	set guifont=Ubuntu_Mono:h12
else
	set background=dark
	colorscheme solarized
endif

"draw line after 80 chars
"set colorcolumn=80
let &colorcolumn=join(range(81,999),",")

"Setup lightline
set hidden
set laststatus=2
set showtabline=2
set noshowmode
if has('gui_running')
        set guioptions-=e
else
	set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

