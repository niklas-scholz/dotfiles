return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    -- Remove restrictions from movement keys
    restricted_keys = {
      ["h"] = {},
      ["j"] = {},
      ["k"] = {},
      ["l"] = {},
    },
    -- Allow arrow keys by overriding the default disabled_keys
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
    disable_mouse = false,
    hints = {
      -- Matches 'A' followed by any number of characters (none in your case)
      -- then escaping and pressing 'i'
      ["A<Esc>i"] = {
        message = function()
          return "Use '$' to move to the end, or just stay in 'A' to type!"
        end,
        length = 3,
      },
      -- Also catching the '$i' habit while we're at it
      ["%$i"] = {
        message = function()
          return "Use 'A' instead of '$i'"
        end,
        length = 2,
      },
    },
  },
}
