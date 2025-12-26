-- Auto-install Packer if not installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

-- Load Packer
local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

-- Configure all plugins
packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tokyonight color scheme
  use 'folke/tokyonight.nvim'

  -- Mini.nvim collection
  use 'echasnovski/mini.nvim'

  -- Which-key for keybinding help
  use 'folke/which-key.nvim'

  -- Fuzzy finder (Space + ff)
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use {
    'saghen/blink.cmp',
    version = 'v0.*',
    requires = 'rafamadriz/friendly-snippets',
  }

  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- GitHub Copilot
  use 'github/copilot.vim'
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    requires = {
      'github/copilot.vim',
      'nvim-lua/plenary.nvim',
    }
  }

  -- Lazygit integration
  use 'kdheepak/lazygit.nvim'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- File explorer
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
end)

-- Manual installation command
vim.api.nvim_create_user_command('FixPlugins', function()
  vim.cmd('PackerClean')
  vim.cmd('PackerSync')
end, {})
