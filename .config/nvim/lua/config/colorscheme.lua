-- Configure tokyonight
local tokyonight_ok, tokyonight = pcall(require, 'tokyonight')
if tokyonight_ok then
  tokyonight.setup({
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },
  })
end

-- Set colorscheme (with fallback)
local colorscheme_ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-night')
if not colorscheme_ok then
  vim.cmd('colorscheme desert')
end
