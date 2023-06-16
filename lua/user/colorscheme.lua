require("onedarkpro").setup({
	options = {
		transparency = true,
		cursorline = true,
	},
	styles = {
		types = "NONE",
		methods = "bold",
		numbers = "NONE",
		strings = "NONE",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "NONE",
		variables = "NONE",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "NONE",
	},
})
vim.cmd("colorscheme onedark")
