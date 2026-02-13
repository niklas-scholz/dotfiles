-- Fix for copilot-cmp trying to access Snacks before it's loaded
-- This overrides LazyVim's copilot extra to ensure proper dependency loading
return {
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)

      -- Safely attach cmp source whenever copilot attaches
      -- This replaces the problematic Snacks.util.lsp.on call in LazyVim
      local has_snacks = pcall(require, "snacks")
      if has_snacks and Snacks and Snacks.util and Snacks.util.lsp then
        Snacks.util.lsp.on({ name = "copilot" }, function()
          copilot_cmp._on_insert_enter({})
        end)
      else
        -- Fallback if Snacks is not available yet
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end,
        })
      end
    end,
  },
}
