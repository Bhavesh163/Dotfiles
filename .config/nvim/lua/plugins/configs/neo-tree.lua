local neo_tree_ok, neo_tree = pcall(require, 'neo-tree')
if not neo_tree_ok then
  return
end

neo_tree.setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
})
