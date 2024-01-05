local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_action = require("lsp-zero").cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "vsnip" },
		-- { name = "copilot" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
