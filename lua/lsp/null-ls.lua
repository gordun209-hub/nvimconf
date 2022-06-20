local nls = require('null-ls')
local on_attach = require('lsp.handlers').on_attach
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
  sources = {
    -- # FORMATTING #
    fmt.trim_whitespace.with({
      filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
    }),

    fmt.rustfmt,
    dgn.shellcheck,
  },
  on_attach = on_attach
})
