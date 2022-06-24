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
    -- hawli
    use({ 'andweeb/presence.nvim', config = function() require("presence"):setup({
            auto_update = true,
        })
    end, event = "BufWinEnter" })
    -- needed for other plugins to work
    use({ "nvim-lua/plenary.nvim" })
    -- icons for other plugins
    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.devicons")
        end,
        event = "VimEnter"
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

    -- comments
    use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } })
    -- idk what this is
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    -- -- THEMES --
    -- use({"sainnhe/sonokai"})
    use({ "rebelot/kanagawa.nvim", config = function() require('colorschemes.kanagawa') end })
    -- use({ 'shaunsingh/nord.nvim', config = function() require('colorschemes.nord') end })
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
    -- swiss army of neovim

    -- use({ 'echasnovski/mini.nvim', config = function() require('mini.surround').setup() end })

    -- LSP --
    -- install lsp
    -- -- for configuration
    use({ "williamboman/nvim-lsp-installer" })
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp")
        end,
        event = "VimEnter"
    })
    use({ "jose-elias-alvarez/null-ls.nvim", config = function() require('lsp.null-ls') end })

    use({ "b0o/schemastore.nvim", config = function() require('lsp.settings.jsonls') end })

    use { 'jose-elias-alvarez/typescript.nvim' }

    use({ 'simrat39/rust-tools.nvim' })
    use {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    -- auto closing tags
    use({ "windwp/nvim-ts-autotag", requires = { "nvim-treesitter" } })
    -- lsp configuration schemas
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
            { "David-Kunz/cmp-npm", requires = "nvim-lua/plenary.nvim", config = function() require('config.cmp-npm') end }
        },
    })
    -- terminal
    use({
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("config.terminal").setup()
        end,
    })
    -- snippets
    use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip', wants = "friendly-snippets", }
    -- copilot but autocomplete
    -- copilot but lua
    -- github copilot for autocomplete
    use({
        "github/copilot.vim",
        config = function()
            require('config.copilot')
        end,
    })
    -- UI PART OF PLUGINS
    -- indent line
    use({ "lukas-reineke/indent-blankline.nvim", config = function() require('config.indentline') end, after = 'nvim-treesitter', event = 'BufRead', })

    -- bufferline
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = function() require('config.bufferline') end }

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
    -- pretty ui
    use({ 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = function() require("config.dressing") end })

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
    -- use({ 'nvim-pack/nvim-spectre', after = "plenary.nvim" })

    -- statusline
    -- use({ 'feline-nvim/feline.nvim', config = function() require('config.feline') end })
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
        config = function() require('lsp.lsp-signatures') end,
        after = 'nvim-lspconfig'
    }
    -- pretty notifications

    use({
        "rcarriga/nvim-notify",
        config = function()
            require("config.notify").config()
        end, event = "BufEnter"
    })
    -- tabs for workspaces
    -- smooth scroll
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.colorizer")
        end, after = "nvim-treesitter",
        event = { "BufRead", "BufNewFile" }
    })
    -- project manager
    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("config.project-manager")
        end,
        requires = { { "nvim-telescope/telescope.nvim" } },
    })
    -- tmux navigation
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
    --commenting
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("config.comment")
        end,
        requires = "joosepalviste/nvim-ts-context-commentstring",
        event = 'BufWinEnter',
    })
    use { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', config = "require('config.gps')", after = 'nvim-treesitter' }
    use({
        -- calc startup time
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    })

end)
