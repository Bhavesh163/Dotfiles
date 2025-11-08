local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { 'lua_ls', 'pyright', 'tsserver' },
  automatic_installation = true,
})

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp_ok and cmp_nvim_lsp.default_capabilities() or {}

-- Setup common servers
local servers = { 'lua_ls', 'pyright', 'tsserver', 'html', 'cssls' }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end
