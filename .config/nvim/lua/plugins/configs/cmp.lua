local blink_ok, blink = pcall(require, 'blink.cmp')
if not blink_ok then
  return
end

blink.setup({
  keymap = {
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },
  
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono',
    kind_icons = {
      Text = '󰉿',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰜢',
      Variable = '󰀫',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '󰑭',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '󰈇',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '󰙅',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '',
    }
  },
  
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      border = 'rounded',
      winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      draw = {
        treesitter = { 'lsp' },
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
      }
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = 'rounded',
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
      }
    },
  },
  
  signature = {
    enabled = true,
    window = {
      border = 'rounded',
      winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
    }
  }
})

-- Custom highlight groups for cyberdream colors
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = '#16181a', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#00d4ff' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = '#5865f2' })
vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = '#0c0e10', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { fg = '#00d4ff' })
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { bg = '#0c0e10', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { fg = '#00d4ff' })
