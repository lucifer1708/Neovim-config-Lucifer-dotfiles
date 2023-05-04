-- Require LSP config which we can use to attach gopls
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
-- Since we installed lspconfig and imported it, we can reach
-- gopls by lspconfig.gopls
-- we can then set it up using the setup and insert the needed configurations
lspconfig.bashls.setup {
     cmd = { "bash-language-server", "start" },
     filetypes = { "sh", "bash", "zsh" },
     root_dir = util.path.dirname,
}

