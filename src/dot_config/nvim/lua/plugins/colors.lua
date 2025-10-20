return {
  {
    "EdenEast/nightfox.nvim", -- lazy
    priority = 1000, -- Ensure it loads first
  },
  {
    "Mofiqul/dracula.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "rebelot/kanagawa.nvim", -- lazy
    priority = 1000, -- Ensure it loads first
    opts = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
