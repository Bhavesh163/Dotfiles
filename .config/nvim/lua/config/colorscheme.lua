-- Configure cyberdream
local cyberdream_ok, cyberdream = pcall(require, 'cyberdream')
if cyberdream_ok then
  cyberdream.setup({
    transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    borderless_telescope = true,
    terminal_colors = true,
  })
end

-- Set colorscheme (with fallback)
local colorscheme_ok, _ = pcall(vim.cmd, 'colorscheme cyberdream')
if not colorscheme_ok then
  vim.cmd('colorscheme desert')
end
