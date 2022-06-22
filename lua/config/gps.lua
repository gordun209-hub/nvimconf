require("nvim-gps").setup({

  disable_icons = true, -- Setting it to true will disable all icons

  -- Add custom configuration per language or
  -- Disable the plugin for a language
  -- Any language not disabled here is enabled by default
  languages = {
    -- Some languages have custom icons
    -- Disable for particular languages
    -- ["bash"] = false, -- disables nvim-gps for bash
    -- ["go"] = false,   -- disables nvim-gps for golang

    -- Override default setting for particular languages
    -- ["ruby"] = {
    --	separator = '|', -- Overrides default separator with '|'
    --	icons = {
    --		-- Default icons not specified in the lang config
    --		-- will fallback to the default value
    --		-- "container-name" will fallback to default because it's not set
    --		["function-name"] = '',    -- to ensure empty values, set an empty string
    --		["tag-name"] = ''
    --		["class-name"] = '::',
    --		["method-name"] = '#',
    --	}
    --}
  },

  separator = ' > ',

  -- limit for amount of context shown
  -- 0 means no limit
  depth = 0,

  -- indicator used when context hits depth limit
  depth_limit_indicator = ".."
})
