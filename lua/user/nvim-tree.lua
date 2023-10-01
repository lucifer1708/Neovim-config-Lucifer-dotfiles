-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

require("nvim-tree").setup({
     auto_reload_on_write = true,
     disable_netrw = false,
     hijack_cursor = false,
     hijack_netrw = true,
     hijack_unnamed_buffer_when_opening = false,
     open_on_tab = false,
     sort_by = "name",
     update_cwd = false,
     reload_on_bufenter = false,
     renderer = {
          indent_markers = {
               enable = true,
               icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
               },
          },
          icons = {
               webdev_colors = true,
               git_placement = "before",
               padding = " ",
               symlink_arrow = " ➛ ",
               show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
               },
               glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                         arrow_closed = "",
                         arrow_open = "",
                         default = "",
                         open = "",
                         empty = "",
                         empty_open = "",
                         symlink = "",
                         symlink_open = "",
                    },
                    git = {
                         unstaged = "✗",
                         staged = "✓",
                         unmerged = "",
                         renamed = "➜",
                         untracked = "★",
                         deleted = "",
                         ignored = "◌",
                    },
               },
          },
     },
     hijack_directories = {
          enable = true,
          auto_open = true,
     },
     update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {},
     },
     -- ignore_ft_on_setup = {},
     system_open = {
          cmd = "",
          args = {},
     },
     diagnostics = {
          enable = false,
          show_on_dirs = false,
          icons = {
               hint = "",
               info = "",
               warning = "",
               error = "",
          },
     },
     filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
     },
     git = {
          enable = true,
          ignore = true,
          timeout = 400,
     },
     actions = {
          use_system_clipboard = true,
          change_dir = {
               enable = true,
               global = false,
               restrict_above_cwd = false,
          },
          open_file = {
               quit_on_open = false,
               resize_window = false,
               window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                         filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                         buftype = { "nofile", "terminal", "help" },
                    },
               },
          },
     },
     trash = {
          cmd = "trash",
          require_confirm = true,
     },
     live_filter = {
          prefix = "[FILTER]: ",
          always_show_folders = true,
     },
     log = {
          enable = false,
          truncate = false,
          types = {
               all = false,
               config = false,
               copy_paste = false,
               diagnostics = false,
               git = false,
               profile = false,
          },
     },
})

require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}
