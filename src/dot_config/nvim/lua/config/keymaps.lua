-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function insertFullPath()
  -- thats total path
  -- local filepath = vim.fn.expand("%:p")
  -- thats relative path:
  local filepath = vim.fn.expand("%")
  -- with quotes around it:
  -- vim.fn.setreg("+", '"' .. filepath .. '"')
  vim.fn.setreg("+", filepath) -- write to clippoard
end
vim.keymap.set("n", "<leader>cp", insertFullPath, { noremap = true, silent = true })
map("n", "<leader>cP", "<cmd>PythonCopyReferenceDotted<cr>", { desc = "Copy Python Path" })

map({ "n", "i" }, "<C-h>", "<cmd>lua require'tmux'.move_left()<cr>", { desc = "Go to left window" })
map({ "n", "i" }, "<C-j>", "<cmd>lua require'tmux'.move_bottom()<cr>", { desc = "Go to lower window" })
map({ "n", "i" }, "<C-k>", "<cmd>lua require'tmux'.move_top()<cr>", { desc = "Go to upper window" })
map({ "n", "i" }, "<C-l>", "<cmd>lua require'tmux'.move_right()<cr>", { desc = "Go to right window" })

vim.keymap.set("n", "<leader>N", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
map("n", "<leader>tf", live_grep_args_shortcuts.grep_word_under_cursor)

-- Don't override clipboard when using x
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')
