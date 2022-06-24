local nls = require('null-ls')
local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
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
        fmt.raco_fmt,
    },
    on_attach = on_attach,
    capabilities = capabilities
})
