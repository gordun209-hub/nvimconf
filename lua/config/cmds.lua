-- Disable diagnostics in node_modules (0 is current buffer only)

vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
local highlight_group = vim.api.nvim_create_augroup("Highlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higrou = "IncSearch", timeout = 400 })
  end,
  group = highlight_group,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "fix all on save",
  pattern = "*.tsx,*.ts,*.jsx,*.js",
  command = "EslintFixAll",
  group = highlight_group,

})
--
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})
-- -- for cursor options
-- --
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	desc = "Hide cursorline in insert mode",
-- 	pattern = "*",
-- 	command = "set nocul",
-- 	group = vimrc_group,
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	desc = "Show cursorline when leaving insert mode",
-- 	pattern = "*",
-- 	command = "set cul",
-- 	group = vimrc_group,
-- })
--
-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter", "CmdlineLeave" }, {
-- 	desc = "show cursor line only in active window",
-- 	pattern = "*",
-- 	command = "set cursorline",
-- 	group = vimrc_group,
-- })
--
-- vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave", "CmdlineEnter" }, {
-- 	desc = "hide cursor line only in inactive window",
-- 	pattern = "*",
-- 	command = "set nocursorline",
-- 	group = vimrc_group,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	desc = "Autoformat before save",
-- 	pattern = { "*.go", "*.js", "*.ts", "*.tsx", "*.lua", "*.yml", "*.json", "*.prisma" },
-- 	callback = vim.lsp.buf.formatting_seq_sync,
-- 	group = vimrc_group,
-- })
