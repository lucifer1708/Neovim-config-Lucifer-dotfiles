local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommeded")

require("mason").setup()
require("mason-lspconfig").setup()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "rust_analyzer" },
	handlers = {
		lsp_zero.default_setup,
	},
})
