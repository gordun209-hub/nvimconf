require 'nvim-treesitter.configs'.setup {
  ensure_installed = {}, -- one of "all", or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "haskell" }, -- list of parsers to ignore installing
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- additional_vim_regex_highlighting = false,
  },


  indent = {
    enable = true
  },

  rainbow = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["~"] = "@parameter.inner",
    },
  },
}
