local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
     return
end

configs.setup({
     ensure_installed = {"tsx", "c", "rust", "lua", "typescript", "javascript", "python" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
     sync_install = false,                                                        -- install languages synchronously (only applied to `ensure_installed`)
     ignore_install = { "" },                                                     -- List of parsers to ignore installing
     autopairs = {
          enable = true,
     },
     highlight = {
          enable = true,
     },
     autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = {
               "html",
               "javascript",
               "typescript",
               "javascriptreact",
               "typescriptreact",
               "svelte",
               "vue",
               "tsx",
               "jsx",
               "rescript",
               "xml",
               "php",
               "markdown",
               "astro",
               "glimmer",
               "handlebars",
               "hbs",
          },
     },
     indent = { enable = true, disable = { "yaml" } },
})
