-- Custom colors
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

-- Custom theme
local custom_theme = {
  normal = {
    a = { fg = colors.darkblue, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.darkblue, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  visual = {
    a = { fg = colors.darkblue, bg = colors.violet, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  replace = {
    a = { fg = colors.darkblue, bg = colors.red, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  command = {
    a = { fg = colors.darkblue, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

require('lualine').setup {
  options = {
    theme = custom_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '' },
        right_padding = 2,
        fmt = function(str)
          return ' ' .. str:sub(1,1) .. ' '
        end,
      },
    },
    lualine_b = {
      {
        'branch',
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
        separator = { right = '' },
      },
      {
        'diff',
        symbols = { added = ' ', modified = '柳', removed = ' ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
      },
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = ' ',
          unnamed = ' [No Name]',
          newfile = ' ',
        },
        color = { fg = colors.cyan, gui = 'bold' },
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'nvim_lsp' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '💡' },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
          hint = { fg = colors.green },
        },
        separator = { left = '', right = '' },
      },
    },
    lualine_x = {
      {
        function()
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return '󰅚 No LSP'
          end
          
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return ' ' .. client.name
            end
          end
          return '󰅚 No LSP'
        end,
        color = { fg = colors.magenta, gui = 'bold' },
        separator = { left = '', right = '' },
      },
      {
        function()
          local buf_size = vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0))
          if buf_size < 1024 then
            return string.format(' %dB', buf_size)
          elseif buf_size < 1024 * 1024 then
            return string.format(' %.1fK', buf_size / 1024)
          else
            return string.format(' %.1fM', buf_size / (1024 * 1024))
          end
        end,
        color = { fg = colors.green },
      },
      {
        'encoding',
        fmt = string.upper,
        color = { fg = colors.orange },
      },
      {
        'fileformat',
        symbols = {
          unix = '',
          dos = '',
          mac = '',
        },
        color = { fg = colors.blue },
      },
      {
        'filetype',
        colored = true,
        icon_only = false,
        icon = { align = 'right' },
        color = { gui = 'bold' },
      },
    },
    lualine_y = {
      {
        function()
          local line = vim.fn.line('.')
          local col = vim.fn.virtcol('.')
          local total = vim.fn.line('$')
          return string.format(' %d:%d/%d', line, col, total)
        end,
        color = { fg = colors.cyan, gui = 'bold' },
        separator = { left = '' },
      },
      {
        'progress',
        fmt = function(str)
          return ' ' .. str .. ' '
        end,
        color = { fg = colors.yellow, gui = 'bold' },
      },
    },
    lualine_z = {
      {
        function()
          return ' ' .. os.date('%H:%M')
        end,
        color = { fg = colors.darkblue, bg = colors.blue, gui = 'bold' },
        separator = { right = '' },
        left_padding = 2,
      },
    },
  },
  inactive_sections = {
    lualine_a = { 
      {
        'filename',
        color = { fg = colors.fg, bg = colors.bg },
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 
      {
        'location',
        color = { fg = colors.fg, bg = colors.bg },
      }
    },
  },
  tabline = {},
  extensions = { 'neo-tree', 'lazy', 'fugitive' },
}
