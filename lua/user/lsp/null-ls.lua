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
          formatting.prettier,
          diagnostics.eslint,
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

local prettier = require("prettier")

prettier.setup({
     bin = "prettier", -- or `'prettierd'` (v0.23.3+)
     filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
     },
     ["null-ls"] = {
          condition = function()
               return prettier.config_exists({
                    -- if `false`, skips checking `package.json` for `"prettier"` key
                    check_package_json = true,
               })
          end,
          runtime_condition = function(params)
               -- return false to skip running prettier
               return true
          end,
          timeout = 5000,
     },
     cli_options = {
          arrow_parens = "always",
          bracket_spacing = true,
          bracket_same_line = false,
          embedded_language_formatting = "auto",
          end_of_line = "lf",
          html_whitespace_sensitivity = "css",
          -- jsx_bracket_same_line = false,
          jsx_single_quote = false,
          print_width = 80,
          prose_wrap = "preserve",
          quote_props = "as-needed",
          semi = true,
          single_attribute_per_line = false,
          single_quote = false,
          tab_width = 2,
          trailing_comma = "es5",
          use_tabs = false,
          vue_indent_script_and_style = false,
     },
})
