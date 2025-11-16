-- GitHub Copilot Configuration
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Key mappings
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-h>', '<Plug>(copilot-dismiss)')

-- Copilot Chat
require('CopilotChat').setup()

vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', { desc = 'Copilot Chat' })
vim.keymap.set('v', '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Explain code' })
vim.keymap.set('v', '<leader>cf', ':CopilotChatFix<CR>', { desc = 'Fix code' })
vim.keymap.set('v', '<leader>co', ':CopilotChatOptimize<CR>', { desc = 'Optimize code' })
