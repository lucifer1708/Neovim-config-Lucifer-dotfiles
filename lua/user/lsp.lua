local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
     'rust_analyzer',
     'lua_ls',
     'pyright'
})

lsp.nvim_workspace()
lsp.setup()
