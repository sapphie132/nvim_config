local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require 'plugins.config.treesitter'

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ibhagwan/fzf-lua'
  use 'lambdalisue/suda.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'romgrk/nvim-treesitter-context'
  use 'sheerun/vim-polyglot'

  -- better folding for python
  use 'tmhedberg/SimpylFold'


  use 'preservim/nerdtree'
  -- shows git file status in NERDTree
  use { 'Xuyuanp/nerdtree-git-plugin' }

  -- colored file type icons in NERDTree
  use { 'tiagofumo/vim-nerdtree-syntax-highlight' }

  -- Airline plugins {{{1
  -- pretty, segmented and configurable status line
  use 'vim-airline/vim-airline'

  -- adds highlighting of only the local scope
  use { 'folke/twilight.nvim', requires = { 'nvim-treesitter/nvim-treesitter' } }

  -- toggle line commenting with a key map
  use 'tpope/vim-commentary'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
