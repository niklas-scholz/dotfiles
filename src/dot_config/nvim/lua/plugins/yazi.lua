return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    commit = "f255e4f1c219d7183cef8e6c0067b8a01f3cc3be",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>n",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
      yazi_floating_window_border = "none",
    },
  },
  {
    "MunifTanjim/nui.nvim",
    commit = "8d3bce9764e627b62b07424e0df77f680d47ffdb",
  },
}
