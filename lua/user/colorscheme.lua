require('everblush').setup({
     -- Override the default highlights using Everblush or other colors
     -- override = {
     --      Normal = { fg = '#ffffff', bg = 'comment' },
     -- },

     -- Set transparent background
     transparent_background = true,

     -- Set contrast for nvim-tree highlights
     nvim_tree = {
          contrast = true,
     },
})
-- require('rose-pine').setup({
--      dark_variant = 'moon',
--      bold_vert_split = true,
--      dim_nc_background = true,
--      disable_background = true,
--      disable_float_background = true,
--      disable_italics = false,
--      groups = {
--           background = 'base',
--           panel = 'surface',
--           border = 'highlight_med',
--           comment = 'muted',
--           link = 'iris',
--           punctuation = 'subtle',
--           error = 'love',
--           hint = 'iris',
--           info = 'foam',
--           warn = 'gold',
--           headings = {
--                h1 = 'iris',
--                h2 = 'foam',
--                h3 = 'rose',
--                h4 = 'gold',
--                h5 = 'pine',
--                h6 = 'foam',
--           }
--           -- or set all headings at once
--           -- headings = 'subtle'
--      },
--      -- Change specific vim highlight groups
--      highlight_groups = {
--           ColorColumn = { bg = 'moon' }
--      }
-- })

-- -- set colorscheme after options
vim.cmd('colorscheme everblush')
