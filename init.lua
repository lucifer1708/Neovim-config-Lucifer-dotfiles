require("user.options")
require("user.lsp")
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.fzf")
require("user.nvim-comment")
require "user.colorizer"
-- require("user.sniprun")
require("user.neoscroll")
require("user.colorscheme")
-- Language Servers Config
require("user.gopls")
require("user.bashls")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
     ["*"] = false,
     ["javascript"] = true,
     ["typescript"] = true,
     ["lua"] = false,
     ["rust"] = true,
     ["c"] = true,
     ["c#"] = true,
     ["c++"] = true,
     ["go"] = true,
     ["python"] = true,
}


vim.o.completeopt = "menu,menuone,noselect"
vim.g.coq_settings = {
  ["clients.copilot.enable"] = true
}
