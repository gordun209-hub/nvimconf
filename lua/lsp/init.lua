local typescript_ok, typescript = pcall(require, 'typescript')
require("lsp.lsp-installer") -- this installs servers
require("lsp.handlers").setup() -- this exposes handlers
local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = require('lsp.settings.tailwindcss').filetypes,
  init_options = require('lsp.settings.tailwindcss').init_options,
  on_attach = require('lsp.settings.tailwindcss').on_attach,
  handlers = handlers,
  settings = require('lsp.settings.tailwindcss').settings,
}

typescript.setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  disable_formatting = false, -- disable tsserver's formatting capabilities
  debug = false, -- enable debug logging for commands
  server = {
    capabilities = capabilities,
    on_attach = require('lsp.settings.tsserver').on_attach,
    handlers = handlers
  }
})

lspconfig.eslint.setup {
  -- this line is new
  root_dir = lspconfig.util.root_pattern(
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json'
  ),
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require('lsp.settings.eslint').settings,
  handlers = handlers
}

require('lsp.settings.jsonls')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = require('lsp.settings.sumneko-lua').settings,
  capabilities = capabilities
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

require('lsp.settings.rust').setup(on_attach, capabilities)

lspconfig.prismals.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
