-- vim.g.did_load_filetypes = 1
require("user.options")
require("user.lsp-zero")
require("user.lsp")
require("user.keymaps")
require("user.cmp")
require("user.plugins")
require("user.telescope")
require("user.treesitter")
require("user.gitsigns")
require("user.nvim-tree")
require("user.toggleterm")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.fzf")
require("user.comment")
require("user.colorscheme")
require("user.gopls")
require("user.bashls")

local fn, cmd = vim.fn, vim.cmd

local function branch_name()
	local branch = fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	if branch ~= "" then
		return branch
	else
		return ""
	end
end

function my_statusline()
	local branch = branch_name()

	if branch and #branch > 0 then
		branch = "  " .. branch
	end

	return branch .. " %f%m%=%l:%c"
end

cmd([[ set statusline=%!luaeval('my_statusline()') ]])

require("bufdel").setup({
	next = "tabs",
	quit = true,
})
