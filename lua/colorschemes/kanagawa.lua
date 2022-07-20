require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,       -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
})

-- Set kanagawa as the colourscheme of the system

-- Set some custom highlights on this colourscheme
-- vim.api.nvim_set_hl(0, 'WinSeparator',               {bg=nil, fg=colors.crystalBlue, bold=true})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar',        {bg=nil, fg=colors.sumiInk2, bold=true})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {bg=nil, fg=colors.oniViolet, bold=true})
-- -- setup must be called before loading
vim.cmd("colorscheme kanagawa")
