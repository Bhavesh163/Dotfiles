-- NeoTree file explorer (Space + e)
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, desc = 'Toggle file tree' })

-- Telescope fuzzy finder (Space + ff)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true, desc = 'Find files' })

-- Copy-paste keymaps for WSL
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<C-v>', '"+p', { desc = 'Paste from system clipboard' })

-- Git keymaps
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })
vim.keymap.set('n', '<leader>gl', ':Git pull<CR>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>ga', ':Git add .<CR>', { desc = 'Git add all' })
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'LazyGit' })

-- Debugger keymaps
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Debug: Continue' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = 'Debug: Open REPL' })

-- LSP keymaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
