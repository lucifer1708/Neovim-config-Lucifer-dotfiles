local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash", "zsh" },
	root_dir = util.path.dirname,
})
