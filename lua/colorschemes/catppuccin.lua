local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
catppuccin.setup({
    transparent_background = true,
    term_colors = true,
    styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "italic",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        },
        which_key = false,
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = false,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
        hop = false,
        notify = false,
        telekasten = false,
    },
})

vim.cmd([[
  try
    colorscheme catppuccin
    hi Normal guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
    hi SpecialKey guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi SignColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
    hi StatusLine guibg=NONE
    hi StatusLineNC guibg=NONE guifg=NONE
    hi Pmenu guibg=NONE ctermbg=none
    hi NormalFloat guibg=NONE ctermbg=NONE
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
