require("user.options")
require("user.lsp")
require("user.keymaps")
require("user.plugins")
-- require("user.cmp")
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
require("user.neoscroll")
require("user.colorscheme")
-- Language Servers Config
require("user.gopls")
require("user.bashls")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
     ["*"] = false,
     ["javascriptreact"] = true,
     ["typescriptreact"] = true,
     ["javascript"] = true,
     ["typescript"] = true,
     ["lua"] = false,
     ["rust"] = true,
     ["c"] = true,
     ["c#"] = true,
     ["c++"] = true,
     ["go"] = true,
     ["sh"] = true,
     ["bash"] = true,
     ["python"] = true,
}

vim.o.completeopt = "menu,menuone,noselect"
vim.g.coq_settings = {
     ["auto_start"] = 'shut-up',
     ["keymap.jump_to_mark"] = 'M-m',
     ["keymap.manual_complete"] = 'C-p',
     ["clients.lsp.enabled"] = true,
     ["clients.tree_sitter.enabled"] = true,
     ["clients.tabnine.enabled"] = false,
     ["clients.snippets.enabled"] = true,
     ["clients.buffers.enabled"] = true,
     ["clients.buffers.always_on_top"] = false,
     ["clients.tmux.enabled"] = false,
     ['display.pum.fast_close'] = false,
}
require("coq_3p") {
     { src = "nvimlua", short_name = "nLUA" },
     { src = "vimtex",  short_name = "vTEX" },
     { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
}
