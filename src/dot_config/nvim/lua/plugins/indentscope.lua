return {
  "nvim-mini/mini.indentscope",
  opts = {
    draw = {
      delay = 0,
      animation = function()
        return 0
      end,
    },
    symbol = "│",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "alpha",
        "dashboard",
        "fzf",
        "help",
        "lazy",
        "lazyterm",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm",
        "Trouble",
        "trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
