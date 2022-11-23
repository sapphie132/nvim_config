set encoding=utf-8
set autowriteall  " write on many different occasions

" Indentation
set autoindent    " Auto-indent new lines
set expandtab     " Use spaces instead of tabs
set shiftwidth=2  " Number of auto-indent spaces
set smartindent   " Enable smart-indent
set smarttab      " Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab

" Search
set hlsearch      " Highlight all search results
set smartcase     " Enable smart-case search
set ignorecase    " Always case-insensitive
set incsearch     " Searches for strings incrementally

set backup " backups
set backupdir=~/.vim_backups/
set confirm " confirmation dialog
set list " list certain characters
set listchars=trail:·
set listchars+=tab:——→

" Linebreaks
set linebreak     " Break line at certain characters
set breakindent   " Indent broken lines
set briopt+=sbr   " Show line breaks better
set showbreak=>   " Ditto

set matchpairs+=<:> " Add the <> pair to bracket matching
set mouse=a " Enable mouse
"" TODO: add visual indicator for paste mode
"" TODO: look into status line
set pastetoggle=<F12>
"" TODO: set up code block folding
"" TODO: check out select mode
"" TODO? look into spell checking
set number

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup user_config
  autocmd!
  autocmd BufWritePost init.vim source <afile>
augroup end

augroup nerdtree
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
  " Start NERDTree when Vim starts with a directory argument.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
  " Close the tab if NERDTree is the only window remaining in it.
  autocmd BufEnter * if tabpagenr('$') > 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup end

" Disable the typescript lang, because the indenting of comments is atrocious.
" And it breaks gq.
let g:polyglot_disabled = ['typescript']

lua require("plugins")
lua require("plugins.config")

" Switch on syntax highlighting.
if has('nvim') || has('syntax')
  syntax enable
endif

nnoremap <C-P> :Telescope find_files<CR>
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

let g:nuake_position = 'top'
let g:nuake_size = 0.5
let g:start_insert = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99 " Make sure nothing is folded when opening a file

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

if has("win32")
  set shell=C:/cygwin64/bin/bash.exe
  set shellcmdflag+=-i
  set shellcmdflag+=--login
endif

