-- Load configuration modules
require('config.options')
require('config.keymaps')
require('plugins.packer')
require('config.colorscheme')
require('plugins.config')
require('config.copilot')

-- Fix cursor shape on exit
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.fn.chansend(vim.v.stderr, "\027[0 q")
  end,
})
