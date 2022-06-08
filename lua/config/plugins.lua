local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print(
    "Installing packer, plugins and treesitter parsers. After the installation is finished close and open Neovim."
  )
  vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "plugins.lua",
})

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})
return packer.startup(function(use)
  -- manages itself
  use("wbthomason/packer.nvim")
  -- improve startup time
  use({
    "lewis6991/impatient.nvim",
  })
  -- needed for other plugins to work
  use({ "nvim-lua/plenary.nvim" })
  -- icons for other plugins
  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.devicons")
    end,
  })
  -- which key
  use { 'folke/which-key.nvim', config = function() require('config.whichkey') end, event = "BufWinEnter" }
  --  syntax highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('config.treesitter')",
    requires = { "plenary.nvim" },
  })
  -- use({ "EdenEast/nightfox.nvim", config = function() require('colorschemes.nightfox') end })
  -- comments
  use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } })
  -- idk what this is
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  -- -- THEMES --
  -- best theme
  -- use({
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("colorschemes.tokyonight")
  --   end,
  --   requires = "nvim-treesitter",
  -- })

  -- use({ 'rmehri01/onenord.nvim'})
  use({ 'luisiacc/gruvbox-baby', branch = 'main', config = function() require('colorschemes.gruvbox') end })
  -- use({ "sainnhe/gruvbox-material"})
  -- best navigation plugin ever
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      require("config.telescope").setup()
    end,
  }
  -- use({
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require("config.telescope")
  --   end,
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope-fzf-native.nvim" },
  --     { "cljoly/telescope-repo.nvim" },
  --     { "nvim-telescope/telescope-file-browser.nvim" },
  --   },
  -- })

  -- swiss army of neovim

  use({ 'echasnovski/mini.nvim', config = function() require('mini.surround').setup() end })

  -- LSP --
  -- install lsp
  -- -- for configuration
  use({ "williamboman/nvim-lsp-installer" })
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  })

  -- auto closing tags
  use({ "windwp/nvim-ts-autotag", requires = { "nvim-treesitter" } })
  -- lsp configuration schemas
  use({
    "b0o/SchemaStore.nvim",
    after = "nvim-lspconfig",
  })
  -- autocomplete
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      'andersevenrud/cmp-tmux',
      { "David-Kunz/cmp-npm", requires = "nvim-lua/plenary.nvim", config = function() require('config.cmp-npm') end }
    },
  })

  -- snippets
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }
  -- copilot but autocomplete
  -- copilot but lua
  -- github copilot for autocomplete
  use({
    "github/copilot.vim",
    config = function()
      require('config.copilot')
    end,
  })

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" }, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end,
      }
    end,
  }
  -- displays errors noice
  use({
    "folke/trouble.nvim",
    config = function() require('config.trouble') end,
    requires = "nvim-web-devicons",
    after = {
      'nvim-lspconfig', 'nvim-lsp-installer'
    },
    cmd = 'Trouble',
  })

  -- autopairs for jsx
  use({
    "windwp/nvim-autopairs",
    config = "require('config.autopairs')",
    after = { 'nvim-treesitter', 'nvim-cmp' },
    event = 'InsertEnter'
  })
  -- rainbow brackets
  use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }

  -- rename globally
  use({ 'nvim-pack/nvim-spectre', after = "plenary.nvim" })

  -- statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.lualine")
    end,
    event = 'BufEnter',
  })
  -- signature
  use {
    'ray-x/lsp_signature.nvim',
    event = 'CursorHold',
    after = 'nvim-lspconfig',
    config = function() require('config.lsp-signature') end
  }
  -- pretty notifications
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("config.notify").config()
    end,
  })
  -- hawli
  -- use({
  --   "andweeb/presence.nvim",
  --   config = function()
  --     require("presence"):setup({ auto_update = true })
  --   end,
  -- })
  -- json packages for projects
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    ft = 'json',
    event = "BufEnter package.json",
    config = function()
      require("config.js-package-manager")
    end,
  })
  -- project manager
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("config.project-manager")
    end,
    requires = { { "nvim-telescope/telescope.nvim" } },
  })
  -- tabs for workspaces
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = function() require('config.bufferline') end }
  -- use {
  --   "nanozuki/tabby.nvim",
  --   config = require("tabby").setup({
  --     tabline = require("tabby.presets").active_wins_at_tail,
  --   })
  -- }
  -- smooth scroll
  use({
    'karb94/neoscroll.nvim',
    event = 'WinScrolled',
    config = function()
      require('neoscroll').setup({ hide_cursor = false })
    end,
  })
  use({
    "norcalli/nvim-colorizer.lua",
    event = 'CursorHold',
    config = function()
      require("colorizer").setup(
        { '*'; },
        {
          RGB      = true; -- #RGB hex codes
          RRGGBB   = true; -- #RRGGBB hex codes
          names    = true; -- "Name" codes like Blue or blue
          RRGGBBAA = true; -- #RRGGBBAA hex codes
          rgb_fn   = true; -- CSS rgb() and rgba() functions
          hsl_fn   = true; -- CSS hsl() and hsla() functions
          css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn

          -- Available modes: foreground, background, virtualtext
          mode = 'background'
        }
      )
    end,
    after = "nvim-treesitter",
  })

  use({
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      })
    end,
  })

  --highlight words

  use({ "RRethy/vim-illuminate", config = function() require('config.illuminate') end })
  -- navigation
  use({
    "tamago324/lir.nvim",
    config = function()
      require("config.lir")
    end,
    after = { 'nvim-web-devicons' },
  })
  -- indent blank line
  use({ "lukas-reineke/indent-blankline.nvim", config = function() require('config.indentline') end, after = 'nvim-treesitter', event = 'BufRead', })
  --commenting
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("config.comment")
    end,
    requires = "joosepalviste/nvim-ts-context-commentstring",
    event = 'BufWinEnter',
  })
  -- ts special
  use { 'jose-elias-alvarez/typescript.nvim' }
  use({
    -- calc startup time
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  })
  use({ 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = function() require("config.dressing") end })
end)
