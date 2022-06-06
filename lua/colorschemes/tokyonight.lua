local tokyonight_colors = require("tokyonight.colors").setup({})

-- Tokyonight config
--
vim.g.tokyonight_transparent = 0
vim.g.tokyonight_transparent_sidebar = 0
vim.g.tokyonight_style = "night"
--vim.g.tokyonight_lualine_bold = 1
vim.g.tokyonight_italic_functions = true

-- Nighyfly config
vim.g.nightflyCursorColor = 1
vim.g.nightflyUnderlineMatchParen = 0
vim.g.nightflyNormalFloat = 1

vim.cmd [[colorscheme tokyonight]]

-- Cursor line
vim.highlight.create("CursorLineNR", { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false)

vim.highlight.link("LineNr", "Comment", true)
vim.highlight.create("NormalFloat", { guibg = "None", guifg = "None" }, false)
vim.highlight.create("FloatBorder", { guibg = "None" }, false)
vim.highlight.create("WhichKeyFloat", { guibg = "None" }, false)
vim.highlight.create("BufferTabpageFill", { guifg = "None" }, false)
vim.highlight.create("VertSplit", { guibg = "#16161e", guifg = "#16161e" }, false)
vim.highlight.create("TelescopeNormal", { guibg = "None", guifg = "None" }, false)
vim.highlight.create("TelescopeBorder", { guibg = "None", guifg = "None" }, false)
vim.highlight.link("TelescopeMatching", "Constant", true)
vim.highlight.link("GitSignsCurrentLineBlame", "Comment", true)
vim.highlight.create("StatusLine", { guibg = "None" }, false)
vim.highlight.create("StatusLineNC", { guibg = "None" }, false)
vim.highlight.create("rainbowcol1", { guifg = tokyonight_colors.blue, ctermfg = 9 }, false)
vim.highlight.create("Boolean", { guifg = "#F7768E" }, false)
vim.highlight.create("BufferOffset", { gui = "bold", guifg = "None", guibg = "#16161e" }, false)

-- Completion Menu Colors
vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokyonight_colors.blue0 })

-- Errors
vim.highlight.create("LspDiagnosticsVirtualTextError", { guifg = "Red", ctermfg = "Red", gui = "bold" }, false)
vim.highlight.create("DiagnosticVirtualTextError", { guifg = "Red", ctermfg = "Red", gui = "bold" }, false)

-- Warnings
vim.highlight.create("LspDiagnosticsVirtualTextWarning", { guifg = "Yellow", ctermfg = "Yellow" }, false)
vim.highlight.create("DiagnosticVirtualTextWarn", { guifg = "Yellow", ctermfg = "Yellow" }, false)

-- Info & Hints
vim.highlight.create("DiagnosticVirtualTextInfo", { guifg = "White", ctermfg = "White" }, false)
vim.highlight.create("DiagnosticVirtualTextHint", { guifg = "White", ctermfg = "White" }, false)

-- Comment in italics
vim.highlight.create("Comment", { gui = "italic", cterm = "italic" }, false)

-- Change color of floating popup border
vim.highlight.link("FloatBorder", "NightflyRed", true)
