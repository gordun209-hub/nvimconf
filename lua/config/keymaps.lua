local opts = { noremap = true, silent = true }
local silent = { silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local lsp_keymap = vim.keymap.set
local new_keymap = vim.keymap.set
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "H", "^", silent)
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- PACKER COMMANDS
keymap("n", "<leader>pc", "<cmd>PackerCompile<cr>", opts)
keymap("n", "<leader>pi", "<cmd>PackerInstall<cr>", opts)
keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
keymap("n", "<leader>pS", "<cmd>PackerStatus<cr>", opts)
keymap("n", "<leader>pu", "<cmd>PackerUpdate<cr>", opts)

-- SPLIT VINDOW
keymap("n", "<leader>ss", "<cmd>split<cr>", opts)
keymap("n", "<leader>sv", "<cmd>vsplit<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save file with ctrl + s
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

---     Telescope
keymap("n", "<leader>fg", "<CMD>Telescope git_branches<CR>", {})
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", {})
keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", {})
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
keymap(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  opts
)
keymap(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>",
  opts
)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffersbuffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<L>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<H>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- search and replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)

keymap("n", "<leader>'", "<cmd>1ToggleTerm size=15 direction=horizontal<cr>", opts)
-- TROUBLE SHORTCUTS
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- Show package versions
-- vim.api.nvim_set_keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })
--
-- -- Hide package versions
-- vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

-- spectre

new_keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
new_keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")
-- lir
keymap("n", "-", "<cmd>:e %:h<cr>", { noremap = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("highlight LirDir ctermfg=109")
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)

-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
-- keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
-- keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
-- keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", silent)
-- --keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
-- keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
-- keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
-- keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
-- keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)


-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float({ border = 'rounded', max_width = 100 }), silent)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, silent)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, silent)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, silent)
--
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, silent)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, silent)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, silent)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, silent)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, silent)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, silent)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, silent)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, silent)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, silent)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, silent)
-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, silent)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, silent)
-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, silent)

-- LSP
lsp_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
lsp_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
lsp_keymap("n", "<C-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
lsp_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
lsp_keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
lsp_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
lsp_keymap("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
lsp_keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
lsp_keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
lsp_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
lsp_keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
lsp_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
lsp_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
