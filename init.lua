require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.fzf")
require("user.nvim-comment")
require("user.colorscheme")
-- require "user.colorizer"
-- require("user.sniprun")

--Lua:
vim.api.nvim_set_keymap(
	"n",
	"mm",
	[[<Cmd>lua require('material.functions').toggle_style()<CR>]],
	{ noremap = true, silent = true }
)
