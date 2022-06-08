require('bufferline').setup {
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = 'nvim_lsp',
    diagnistics_update_in_insert = false,
    color_icons = true,
    show_close_icon = false,
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
  }
}
