local which_key_ok, which_key = pcall(require, 'which-key')
if not which_key_ok then
  return
end

which_key.setup({
  preset = "modern",
  delay = 300,
  expand = 1,
  notify = false,
  
  win = {
    border = "rounded",
    padding = { 1, 2 },
    wo = {
      winblend = 10,
    },
    width = 0.6,
    height = 0.6,
    row = -1,
    col = -1,
  },
  
  layout = {
    width = { min = 20 },
    spacing = 3,
  },
  
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
    ellipsis = "…",
    mappings = true,
    rules = false,
    colors = true,
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
})

-- Register key mappings with cool icons
which_key.add({
  { "<leader>e", desc = "󰉋 File Explorer" },
  { "<leader>E", desc = "󰉋 File Explorer (current)" },
  
  { "<leader>f", group = "󰍉 Find" },
  { "<leader>ff", desc = "󰈞 Find Files" },
  { "<leader>fg", desc = "󰊄 Live Grep" },
  { "<leader>fb", desc = "󰸩 Buffers" },
  { "<leader>fh", desc = "󰋖 Help Tags" },
  
  { "<leader>g", group = "󰊢 Git" },
  { "<leader>gg", desc = "󰊢 Lazygit" },
  
  { "<leader>d", group = "󰃤 Debug" },
  { "<leader>db", desc = "󰏃 Toggle Breakpoint" },
  { "<leader>dc", desc = "󰐊 Continue" },
  { "<leader>ds", desc = "󰆹 Step Over" },
  { "<leader>di", desc = "󰆹 Step Into" },
  { "<leader>do", desc = "󰆹 Step Out" },
  { "<leader>dr", desc = "󰞕 Repl" },
  { "<leader>du", desc = "󰕷 Toggle UI" },
  
  { "<leader>c", group = "󰅩 Code" },
  { "<leader>ca", desc = "󰅩 Code Action" },
  { "<leader>cr", desc = "󰑕 Rename" },
  { "<leader>cf", desc = "󰉼 Format" },
  
  { "<leader>w", group = "󰖲 Window" },
  { "<leader>ws", desc = "󰤼 Split Horizontal" },
  { "<leader>wv", desc = "󰤻 Split Vertical" },
  { "<leader>wc", desc = "󰅖 Close" },
  { "<leader>wo", desc = "󰖲 Only" },
  
  { "<leader>b", group = "󰸩 Buffer" },
  { "<leader>bd", desc = "󰅖 Delete Buffer" },
  { "<leader>bn", desc = "󰒭 Next Buffer" },
  { "<leader>bp", desc = "󰒮 Previous Buffer" },
})
