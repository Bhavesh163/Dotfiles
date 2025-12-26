-- Mini.nvim configuration
local mini_ok, _ = pcall(require, 'mini.files')
if not mini_ok then
  return
end

-- File explorer
require('mini.files').setup({
  mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = 'L',
    go_out      = 'h',
    go_out_plus = 'H',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trim_left   = '<',
    trim_right  = '>',
  },
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 30,
  },
})

-- Statusline
require('mini.statusline').setup()

-- Surround
require('mini.surround').setup()

-- Pairs (auto-close brackets)
require('mini.pairs').setup()

-- Comment
require('mini.comment').setup()

-- Indentscope
require('mini.indentscope').setup({
  symbol = "│",
  options = { try_as_border = true },
})

-- Starter (start screen)
require('mini.starter').setup()

-- Bufremove
require('mini.bufremove').setup()

-- Cursorword
require('mini.cursorword').setup()

-- Jump
require('mini.jump').setup()

-- Move
require('mini.move').setup()

-- Splitjoin
require('mini.splitjoin').setup()

-- Trailspace
require('mini.trailspace').setup()
