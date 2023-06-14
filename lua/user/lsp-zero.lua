local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
})

lsp.nvim_workspace()
lsp.setup()
