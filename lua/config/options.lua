local opt = vim.opt
local options = {
  clipboard = "unnamed,unnamedplus", --- Copy-paste between vim and everything else
  cmdheight = 2, --- Give more space for displaying messages
  emoji = false,
  completeopt = "menu,menuone,noselect", --- Better autocompletion
  cursorline = false, --- Highlight of current line
  expandtab = true, --- Use spaces instead of tabs
  foldlevelstart = 99, --- Expand all folds by default
  foldtext = "CustomFold()", --- Emit custom function for foldtext
  ignorecase = true, --- Needed for smartcase
  laststatus = 3, --- Have a global statusline at the bottom instead of one for each window
  lazyredraw = true, --- Makes macros faster & prevent errors in complicated mappings
  mouse = "a", --- Enable mouse
  number = true, --- Shows current line number
  pumheight = 10, --- Max num of items in completion menu
  relativenumber = false, --- Enables relative number
  shiftwidth = 2, --- Change a number of space characeters inseted for indentation
  showtabline = 2, --- Always show tabs
  smartcase = true, --- Uses case in search
  smartindent = true, --- Makes indenting smart
  smarttab = true, --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop = 2, --- Insert 2 spaces for a tab
  splitright = true, --- Vertical splits will automatically be to the right
  swapfile = false, --- Swap not needed
  tabstop = 2, --- Insert 2 spaces for a tab
  termguicolors = true, --- Correct terminal colors
  undofile = true, --- Sets undo to file
  updatetime = 100, --- Faster completion
  viminfo = "'1000", --- Increase the size of file history
  wrap = false, --- Display long lines as just one line
  writebackup = false, --- Not needed
  -- Neovim defaults
  hlsearch = false,
  autoindent = true, --- Good auto indent
  backspace = "indent,eol,start", --- Making sure backspace works
  backup = false, --- Recommended by coc
  conceallevel = 0, --- Show `` in markdown files
  encoding = "utf-8", --- The encoding displayed
  errorbells = false, --- Disables sound effect for errors
  fileencoding = "utf-8", --- The encoding written to file
  incsearch = true, --- Start searching before pressing enter
  showmode = false, --- Don't show things like -- INSERT -- anymore
}

local globals = {
  dashboard_default_executive = "telescope", --- Use fuzzy search plugin in dashboard
  fillchars = "fold:\\ ", --- Fill chars needed for folds
  mapleader = " ", --- Map leader key to SPC
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- disable some unused options
vim.g.loaded_fzf = 1
vim.g.loaded_gtags = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1



-- indention

-- search
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*", "*node_modules/**" }
opt.wildmenu = true

-- ui
opt.rnu = true
opt.scrolloff = 8
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.signcolumn = "yes"
opt.splitbelow = true -- Open new split below

-- backups

-- autocomplete
opt.shortmess = opt.shortmess + { c = true }
-- perfomance
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }



--vim.o.background = "dark"
