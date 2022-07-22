local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end
npairs.setup {
    --enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = {  "template_string" },
    },
     disable_filetype = { "TelescopePrompt", "spectre_panel" , "scheme"},
    -- fast_wrap = {
    --   map = "<M-e>",
    --   chars = { "{", "[", "(", '"', "'" },
    --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    --   offset = 0, -- Offset from pattern match
    --   end_key = "$",
    --   keys = "qwertyuiopzxcvbnmasdfghjkl",
    --   check_comma = true,
    --   highlight = "PmenuSel",
    --   highlight_grey = "LineNr",
    -- },
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
   
