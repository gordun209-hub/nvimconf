vim.o.inccommand = "nosplit"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Enable highlight on search
vim.o.hlsearch = false
-- highlight match while typing search pattern
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable break indent
vim.o.breakindent = true

-- Use swapfiles tdo
vim.o.undofile = true
vim.o.swapfile = false


-- Save undo history
--vim.o.undolevels = 1000

-- Faster scrolling
vim.o.lazyredraw = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Decrease redraw time
vim.o.redrawtime = 100

-- Set true colors
vim.o.termguicolors = true

-- Disable intro message
vim.opt.shortmess:append("I")

-- Disable ins-completion-menu messages
vim.opt.shortmess:append("c")

-- Do not source the default filetype.vim

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")

-- Take indent for new line from previous line
vim.o.autoindent = true
vim.o.smartindent = true


-- Number of command-lines that are remembered
vim.o.history = 10000

-- Use menu for command line completion

-- Enable wrap
vim.o.wrap = false

-- Wrap long lines at a blank
--vim.o.linebreak = true

-- Highlight the current line
vim.o.cursorline = false

-- Autom. read file when changed outside of Vim
--vim.o.autoread = true

-- Autom. save file before some action
--vim.o.autowrite = true

vim.o.backup = false
vim.o.writebackup = false

-- For opening splits on right or bottom.
vim.o.splitbelow = true
vim.o.splitright = true

-- Show cursor line and column in the status line
--vim.o.ruler = true

-- Briefly jump to matching bracket if insert one
--vim.o.showmatch = true

-- Use filetype.lua instead
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Hide show current mode on status line
vim.o.showmode = false

-- Show absolute line number in front of each line
vim.o.relativenumber = true

--  Maximum height of the popup menu
vim.o.pumheight = 15

-- Minimum nr. of lines above and below cursor
vim.o.scrolloff = 5 -- could be 1
vim.o.sidescrolloff = 5
-- vim.o.display = 'lastline'

-- Ignore case when completing file names and directories.
vim.o.wildmenu = true
vim.o.wildignorecase = true
vim.opt.wildignore = vim.opt.wildignore + { '*/node_modules/*', '*/.git/*', '*/vendor/*' }

vim.opt.laststatus = 3

-- Timeout on leaderkey
vim.o.ttimeout = true
vim.o.ttimeoutlen = 5

-- Timeout on mapped sequences
vim.o.timeout = true
vim.o.timeoutlen = 300
-- editing exp
vim.o.expandtab = true

--vim.o.cindent = true

vim.o.list = true
-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus'

vim.o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- Show (partial) command in status line
vim.o.showcmd = false

-- Configure the number of spaces a tab is counting for
vim.o.tabstop = 4

-- Number of spaces for a step of indent
vim.o.shiftwidth = 4

-- Folding
vim.o.foldenable = true
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Asyncrun automatically open quickfix window
vim.g.asyncrun_open = 6

-- Use ripgrep as grep tool
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"


local globals = {
	dashboard_default_executive = "telescope", --- Use fuzzy search plugin in dashboard
	mapleader = " ", --- Map leader key to SPC
}


for k, v in pairs(globals) do
	vim.g[k] = v
end

-- disable some unused options
local disabled_built_ins = {
	"2html_plugin",
	"bugreport",
	"compiler",
	"ftplugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
	"netrw",
	"netrwFileHandlers",
	"netrwPlugin",
	"netrwSettings",
	"optwin",
	"rplugin",
	"rrhelper",
	"spellfile_plugin",
	"synmenu",
	"syntax",
	"tar",
	"tarPlugin",
	"tutor",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.wo.colorcolumn = "80"


--vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet,hy,racket"
