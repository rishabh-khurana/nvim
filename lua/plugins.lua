local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end


vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Solarised - only works on iterm2
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  -- Telescope with ripgrep installed globally
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- File Buffer
  use 'ThePrimeagen/harpoon'
  -- LSP and completion
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-path' -- Path Completion
  use "neovim/nvim-lspconfig" -- enable LSP
  -- Snippets with completion
  use 'L3MON4D3/LuaSnip'
  -- Tree Sitter - Higlights syntax - TODO
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- Auto Pair and Tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' 
  use {
    "akinsho/toggleterm.nvim", 
    tag = '*', config = function() require("toggleterm").setup() end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  -- Prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  end)
