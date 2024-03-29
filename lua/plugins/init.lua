local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local ensure_packer = function()
  local fn = vim.fn
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'sharkdp/fd'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lambdalisue/suda.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  -- Shows the current context as you scroll down
  use 'romgrk/nvim-treesitter-context'

  -- Diff
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'preservim/nerdtree'
  -- shows git file status in NERDTree
  use { 'Xuyuanp/nerdtree-git-plugin' }
  use 'PhilRunninger/nerdtree-visual-selection'

  use 'tpope/vim-fugitive'

  -- pretty, segmented and configurable status line
  use 'vim-airline/vim-airline'

  -- adds highlighting of only the local scope
  use { 'folke/twilight.nvim', requires = { 'nvim-treesitter/nvim-treesitter' } }
  use { 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' } }

  -- toggle line commenting with a key map
  use 'tpope/vim-commentary'

  use 'rcarriga/nvim-notify'
  use 'Lenovsky/nuake' -- Quake-style terminal

  use 'EdenEast/nightfox.nvim'
  use 'jacoborus/tender.vim'
  use 'ellisonleao/gruvbox.nvim'

  -- harpoon (navigation)
  use 'ThePrimeagen/harpoon'

  use 'mbbill/undotree'
  
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
