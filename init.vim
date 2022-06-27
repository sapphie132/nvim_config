set encoding=utf-8
set autowriteall " write on many different occasions
set autoindent
set smartindent
set smarttab
set softtabstop=2 " One tab is two spaces
set tabstop=2
set backup " backups
set backupdir=~/.vim_backups/
set confirm " confirmation dialog
set gdefault " g option by default on sub
set list " list certain characters
set listchars=trail:·
set listchars+=tab:——→
set smartcase " ignore case on search (if search contains no upper case characters)
set linebreak " break line at certain characters
set breakindent " indent broken lines
set briopt+=sbr " show line breaks better
set showbreak=> " ditto
set matchpairs+=<:> " Add the <> pair to bracket matching
set mouse=v " Use the mouse in visual mode
set number " Line numbers!!!
"" TODO: add visual indicator for paste mode
"" TODO: look into status line
set pastetoggle=<F12>
"" TODO: set up code block folding
"" TODO: check out select mode
"" TODO? look into spell checking
""
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
