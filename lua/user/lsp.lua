local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'rust_analyzer',
  'pyright',
  'sumneko_lua',
})

lsp.nvim_workspace()
lsp.setup()
