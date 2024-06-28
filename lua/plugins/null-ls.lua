return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.golines,
					null_ls.builtins.diagnostics.hadolint,
					null_ls.builtins.diagnostics.golangci_lint,
				},
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
