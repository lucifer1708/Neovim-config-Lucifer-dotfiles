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
     use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
     use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
     use({
          "windwp/nvim-autopairs",
          config = function()
               require("nvim-autopairs").setup({})
          end,
     })
     use("nvim-tree/nvim-web-devicons")
     use("nvim-tree/nvim-tree.lua")
     -- use("akinsho/bufferline.nvim")
     use({ "ojroques/nvim-bufdel" })
     use({
          "nvim-lualine/lualine.nvim",
          requires = { "nvim-tree/nvim-web-devicons", opt = true },
     })
     use("akinsho/toggleterm.nvim")
     use("lewis6991/impatient.nvim")
     use("lukas-reineke/indent-blankline.nvim")
     use("goolord/alpha-nvim")
     use("folke/which-key.nvim")
     -- use("terrortylor/nvim-comment") -- Easily comment stuff
     use("hrsh7th/cmp-nvim-lsp")
     use("hrsh7th/cmp-buffer")
     use("hrsh7th/cmp-path")
     use("hrsh7th/cmp-cmdline")
     use("hrsh7th/nvim-cmp")
     use({ "neovim/nvim-lspconfig" })
     use({ "williamboman/mason.nvim" })
     use({ "williamboman/mason-lspconfig.nvim" })
     use({
          "L3MON4D3/LuaSnip",
          run = "make install_jsregexp",
     })
     use({
          "VonHeikemen/lsp-zero.nvim",
          requires = {
               -- LSP Support
               { "neovim/nvim-lspconfig" },
               { "williamboman/mason.nvim" },
               { "williamboman/mason-lspconfig.nvim" },
               -- Snippets
               { "rafamadriz/friendly-snippets" },
               -- Autocompletion
               { "hrsh7th/nvim-cmp" }, -- Required
               { "hrsh7th/cmp-nvim-lsp" }, -- Required
               { "L3MON4D3/LuaSnip" }, -- Required
          },
     })
     use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })
     use("williamboman/nvim-lsp-installer") -- simple to use language server installer
     use("tamago324/nlsp-settings.nvim") -- language server settings defined in json form
     use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
     use("nvim-telescope/telescope.nvim")
     use({
          "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate",
     })
     use("JoosepAlviste/nvim-ts-context-commentstring")
     use("tpope/vim-fugitive")
     use("lewis6991/gitsigns.nvim")
     -- use("nathom/filetype.nvim")
     use({ "saadparwaiz1/cmp_luasnip" })
     use("hrsh7th/cmp-vsnip")
     use("hrsh7th/vim-vsnip-integ")
     use({ "catppuccin/nvim", as = "catppuccin" })

     use({
          "nvimdev/lspsaga.nvim",
          after = "nvim-lspconfig",
          config = function()
               require("lspsaga").setup({})
          end,
     })
     use("MunifTanjim/prettier.nvim")
     use({
          "numToStr/Comment.nvim",
     })
     use({
          "ahmedkhalf/project.nvim",
          config = function()
               require("project_nvim").setup({})
          end,
     })
     if PACKER_BOOTSTRAP then
          require("packer").sync()
     end
end)
