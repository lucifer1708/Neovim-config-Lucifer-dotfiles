local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.isort,
		formatting.autoflake.with({ extra_args = { "--remove-all-unused-imports", "--remove-unused-variables" } }),
		-- formatting.eslint,
		-- diagnostics.eslint,
		diagnostics.flake8.with({ extra_args = { "--max-line-length", "150" } }),
	},
	-- you can reuse a shared lspconfig on_attach callback here
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd([[
	--              augroup LspFormatting
	--                  autocmd! * <buffer>
	--                  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--              augroup END
	--              ]])
	-- 	end
	-- end,
})
