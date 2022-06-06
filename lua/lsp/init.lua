local typescript_ok, typescript = pcall(require, 'typescript')
require("lsp.lsp-installer") -- this installs servers
require("lsp.handlers").setup() -- this exposes handlers
local lspconfig = require("lspconfig")


local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
lspconfig.tailwindcss.setup {
  capabilities = require('lsp.settings.tsserver').capabilities,
  filetypes = require('lsp.settings.tailwindcss').filetypes,
  init_options = require('lsp.settings.tailwindcss').init_options,
  on_attach = require('lsp.settings.tailwindcss').on_attach,
  settings = require('lsp.settings.tailwindcss').settings,
}
typescript.setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  disable_formatting = false, -- disable tsserver's formatting capabilities
  debug = false, -- enable debug logging for commands
  server = {
    capabilities = require('lsp.settings.tsserver').capabilities,
    on_attach = require('lsp.settings.tsserver').on_attach,
  }
})

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.eslint').settings,
}


lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.jsonls').settings,
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = require('lsp.settings.sumneko-lua').settings,
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.html').settings,
}
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.emmet-ls').settings,
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.bashls').settings
}


lspconfig.prismals.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
