return {
  {
    "Vigemus/iron.nvim",
    keys = {
      { "<leader>is", "<cmd>IronRepl<cr>", desc = "Start Iron REPL" },
      { "<leader>ir", "<cmd>IronRestart<cr>", desc = "Restart Iron REPL" },
    },
    -- We use 'config' instead of 'opts' to ensure the plugin is loaded
    -- before we try to require its sub-modules like iron.view
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")

      iron.setup({
        config = {
          scratch_repl = false,
          repl_definition = {
            python = {
              command = { "ipython", "--no-autoindent" },
            },
          },
          -- Now that the plugin is loaded, this require won't fail
          repl_open_cmd = view.right(60),
        },
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file = "<leader>sf",
          send_line = "<leader>sl",
          send_paragraph = "<leader>sp",
          send_until_cursor = "<leader>su",
          cr = "<leader>s<cr>",
          interrupt = "<leader>si",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
      })
    end,
  },
}
