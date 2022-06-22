local M = {}

function M.setup()
  local gps = require "nvim-gps"

  local function attached_clients()
    return "(" .. vim.tbl_count(vim.lsp.buf_get_clients(0)) .. ")"
  end

  require("lualine").setup {
    options = { theme = "auto" },
    sections = {
      lualine_b = { "branch", "diff" },
      lualine_c = {
        { gps.get_location, cond = gps.is_available },
      },
      lualine_x = {
        { "diagnostics", sources = { "nvim_diagnostic" } },
        { "filetype", separator = { right = "" }, right_padding = 0 },
        { attached_clients, separator = { left = "" }, left_padding = 0 },
      },
    },
    inactive_sections = {},
  }
end

return M
