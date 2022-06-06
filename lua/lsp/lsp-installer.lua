local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    return
end
-- setup here and import init.lua
lsp_installer.setup({

  -- A list of servers to automatically install if they're not already installed
  ensure_installed = { "bashls", "cssls", "eslint", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver"},
  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed



    ui = {
        icons = {
            server_installed = "✓",
            server_uninstalled = "✗",
        },
    },
})
