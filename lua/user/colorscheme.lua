vim.cmd([[
try
  colorscheme lunar
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
-- This is a comment
