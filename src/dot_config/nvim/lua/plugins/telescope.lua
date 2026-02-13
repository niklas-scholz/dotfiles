return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")
      opts.extensions = {
        live_grep_args = {
          file_ignore_patterns = { "node_modules", ".venv", "yarn" },
          additional_args = function(_)
            return {
              "--hidden",
              "--glob",
              "!.git/**", -- exclude everything under .git/
            }
          end,
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              -- ["<C-'>"] = lga_actions.quote_prompt(),
              ["<C-f>"] = require("telescope.actions").to_fuzzy_refine,
              ["<C-p>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-n>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
              ["<C-y>"] = lga_actions.quote_prompt({ postfix = " -t " }),
              ["<C-F>"] = lga_actions.quote_prompt({ postfix = " -F " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      }

      opts.defaults = vim.tbl_extend("force", opts.defaults, {
        file_ignore_patterns = { "node_modules", ".venv", "yarn" },
        mappings = {
          i = {
            ["<C-o>"] = function(prompt_bufnr)
              require("telescope.actions").select_default(prompt_bufnr)
              require("telescope.builtin").resume()
            end,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-e>"] = require("telescope.actions").cycle_history_next,
            ["<C-r>"] = require("telescope.actions").cycle_history_prev,
            ["<C-space>"] = lga_actions.to_fuzzy_refine,
          },
          n = { -- while in normal mode
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Grep (root dir)",
      },
    },
    config = function(_, opts)
      local tele = require("telescope")
      tele.setup(opts)
      tele.load_extension("live_grep_args")
    end,
  },
}
