local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
     PACKER_BOOTSTRAP = fn.system({
          "git",
          "clone",
          "--depth",
          "1",
          "https://github.com/wbthomason/packer.nvim",
          install_path,
     })
     print("Installing packer close and reopen Neovim...")
     vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
     return
end

-- Have packer use a popup window
packer.init({
     display = {
          open_fn = function()
               return require("packer.util").float({ border = "rounded" })
          end,
     },
})

-- Install your plugins here
return packer.startup(function(use)
     -- My plugins here
     use("wbthomason/packer.nvim") -- Have packer manage itself
     use("nvim-lua/popup.nvim")    -- An implementation of the Popup API from vim in Neovim
     use("nvim-lua/plenary.nvim")  -- Useful lua functions used ny lots of plugins
     use("windwp/nvim-autopairs")  -- Autopairs, integrates with both cmp and treesitter
     use("kyazdani42/nvim-web-devicons")
     use("kyazdani42/nvim-tree.lua")
     use("akinsho/bufferline.nvim")
     use("moll/vim-bbye")
     use("nvim-lualine/lualine.nvim")
     use("akinsho/toggleterm.nvim")
     use("ahmedkhalf/project.nvim")
     use("lewis6991/impatient.nvim")
     use("lukas-reineke/indent-blankline.nvim")
     use("goolord/alpha-nvim")
     use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
     use("folke/which-key.nvim")
     use 'karb94/neoscroll.nvim'
     use("terrortylor/nvim-comment") -- Easily comment stuff

     -- Colorschemes
     use 'tiagovla/tokyodark.nvim'
     use { 'Everblush/nvim', as = 'everblush' }
     -- cmp plugins
     use("hrsh7th/vim-vsnip")
     use("hrsh7th/cmp-vsnip")
     -- Completion
     use { 'ms-jpq/coq_nvim', branch = "coq" }
     use { "ms-jpq/coq.artifacts", branch = 'artifacts' }
     use { "ms-jpq/coq.thirdparty", branch = '3p' }

     --      -- LSP Support
     use { 'neovim/nvim-lspconfig' }
     use { 'williamboman/mason.nvim' }
     use { 'williamboman/mason-lspconfig.nvim' }
     -- Autocompletion
     use { "github/copilot.vim" }
     use { 'hrsh7th/nvim-cmp' }
     use { 'hrsh7th/cmp-buffer' }
     use { 'hrsh7th/cmp-path' }
     use { 'saadparwaiz1/cmp_luasnip' }
     use { 'hrsh7th/cmp-nvim-lsp' }
     use { 'hrsh7th/cmp-nvim-lua' }
     use { "ray-x/cmp-treesitter" }
     use { 'f3fora/cmp-spell' }
     use { "tzachar/cmp-tabnine", run = "./install.sh" }
     -- Snippets
     use { 'L3MON4D3/LuaSnip' }
     use {
          'VonHeikemen/lsp-zero.nvim',
          requires = {
               -- LSP Support
               { 'neovim/nvim-lspconfig' },
               { 'williamboman/mason.nvim' },
               { 'williamboman/mason-lspconfig.nvim' },

               -- Autocompletion
               { 'hrsh7th/nvim-cmp' },
               { 'hrsh7th/cmp-buffer' },
               { 'hrsh7th/cmp-path' },
               { 'saadparwaiz1/cmp_luasnip' },
               { 'hrsh7th/cmp-nvim-lsp' },
               { 'hrsh7th/cmp-nvim-lua' },
               { 'f3fora/cmp-spell' },

               -- Snippets
               { 'L3MON4D3/LuaSnip' },
               { 'rafamadriz/friendly-snippets' },
          }
     }
     use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })

     -- snippets
     use('uga-rosa/ccc.nvim')
     -- LSP
     -- use("neovim/nvim-lspconfig") -- enable LSP
     use("williamboman/nvim-lsp-installer") -- simple to use language server installer
     use("tamago324/nlsp-settings.nvim")    -- language server settings defined in json form
     use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

     -- Telescope
     use("nvim-telescope/telescope.nvim")

     -- Treesitter
     use({
          "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate",
     })
     use("JoosepAlviste/nvim-ts-context-commentstring")

     use('mg979/vim-visual-multi')
     -- Git
     use("lewis6991/gitsigns.nvim")
     -- install without yarn or npm
     use({
          "iamcco/markdown-preview.nvim",
          run = function() vim.fn["mkdp#util#install"]() end,
     })


     -- Code runner
     use({ "michaelb/sniprun", run = "bash ./install.sh" })
     -- Automatically set up your configuration after cloning packer.nvim
     -- Put this at the end after all plugins
     if PACKER_BOOTSTRAP then
          require("packer").sync()
     end
end)
