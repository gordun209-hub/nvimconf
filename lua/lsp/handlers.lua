local present3, navic = pcall(require, "nvim-navic")

local M = {}
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end


  local codes = {
    -- Lua
    no_matching_function = {
      message = " Can't find a matching function",
      "redundant-parameter",
      "ovl_no_viable_function_in_call",
    },
    empty_block = {
      message = " That shouldn't be empty here",
      "empty-block",
    },
    missing_symbol = {
      message = " Here should be a symbol",
      "miss-symbol",
    },
    expected_semi_colon = {
      message = " Please put the `;` or `,`",
      "expected_semi_declaration",
      "miss-sep-in-table",
      "invalid_token_after_toplevel_declarator",
    },
    redefinition = {
      message = " That variable was defined before",
      icon = " ",
      "redefinition",
      "redefined-local",
      "no-duplicate-imports",
      "@typescript-eslint/no-redeclare",
      "import/no-duplicates"
    },
    no_matching_variable = {
      message = " Can't find that variable",
      "undefined-global",
      "reportUndefinedVariable",
    },
    trailing_whitespace = {
      message = "  Whitespaces are useless",
      "trailing-whitespace",
      "trailing-space",
    },
    unused_variable = {
      message = "  Don't define variables you don't use",
      icon = "  ",
      "unused-local",
      "@typescript-eslint/no-unused-vars",
      "no-unused-vars"
    },
    unused_function = {
      message = "  Don't define functions you don't use",
      "unused-function",
    },
    useless_symbols = {
      message = " Remove that useless symbols",
      "unknown-symbol",
    },
    wrong_type = {
      message = " Try to use the correct types",
      "init_conversion_failed",
    },
    undeclared_variable = {
      message = " Have you delcared that variable somewhere?",
      "undeclared_var_use",
    },
    lowercase_global = {
      message = " Should that be a global? (if so make it uppercase)",
      "lowercase-global",
    },
    -- Typescript
    no_console = {
      icon = "  ",
      "no-console",
    },
    -- Prettier
    prettier = {
      icon = "  ",
      "prettier/prettier"
    }
  }

  vim.diagnostic.config({
    float = {
      source = false,
      format = function(diagnostic)
        local code = diagnostic.user_data.lsp.code

        if not diagnostic.source or not code then
          return string.format('%s', diagnostic.message)
        end

        if diagnostic.source == 'eslint' then
          for _, table in pairs(codes) do
            if vim.tbl_contains(table, code) then
              return string.format('%s [%s]', table.icon .. diagnostic.message, code)
            end
          end

          return string.format('%s [%s]', diagnostic.message, code)
        end

        for _, table in pairs(codes) do
          if vim.tbl_contains(table, code) then
            return table.message
          end
        end

        return string.format('%s [%s]', diagnostic.message, diagnostic.source)
      end
    },
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = {
      prefix = "",
    },
  })
  -- local config = {
  --   -- disable virtual text
  --   virtual_text = false,
  --   -- show signs
  --   signs = {
  --     active = signs,
  --   },
  --   update_in_insert = true,
  --   underline = true,
  --   severity_sort = true,
  --   float = {
  --     focusable = true,
  --     style = "minimal",
  --     border = "rounded",
  --     source = "always",
  --     header = "",
  --     prefix = "",
  --     -- width = 40,
  --   },
  -- }
  -- -- local config = {
  -- --   -- disable virtual text
  -- --   virtual_text = {
  -- --     source = "always",
  -- --     spacing = 6,
  -- --
  -- --   },
  -- --   -- show signs
  -- --   update_in_insert = false,
  -- --   underline = true,
  -- --   severity_sort = true,
  -- --   float = {
  -- --     focusable = false,
  -- --     style = "minimal",
  -- --     border = "rounded",
  -- --     source = "always",
  -- --     header = "",
  -- --     prefix = "",
  -- --   },
  -- -- }
  --
  -- vim.diagnostic.config(config)
  -- --
end
local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-----------------------------------------------------------------

local function lsp_keymaps(client, bufnr)
  local opts = { noremap = true, silent = true }
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  --
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", bufopts)

end

-------------------------------------------------------------------
---  -----------------------------------------------------------------
M.on_attach = function(client, bufnr)
  -- if (client.name == 'tsserver') then
  --   client.server_capabilities.documentFormattingProvider = false
  --   client.server_capabilities.documentRangeFormattingProvider = false
  -- end
  -- if (client.name == 'tailwindcss') then
  --   client.server_capabilities.documentFormattingProvider = false
  --   client.server_capabilities.documentRangeFormattingProvider = false
  -- end
  -- if (client.name == "eslint") then
  --   client.server_capabilities.documentFormattingProvider = true
  -- end
  lsp_highlight_document(client)
  lsp_keymaps(bufnr)

  if client.supports_method("textDocument/documentSymbol") then
    navic.attach(client, bufnr)
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }
return M

--------------------------------------------------------------------
--
