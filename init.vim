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
set mouse=v " Use the mouse in visual mode
"" TODO: add visual indicator for paste mode
"" TODO: look into status line
set pastetoggle=<F12>
"" TODO: set up code block folding
"" TODO: check out select mode
"" TODO? look into spell checking


set foldmethod=indent
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup user_config
  autocmd!
  autocmd BufWritePost init.vim source <afile>
augroup end

lua require("lua.plugins")
