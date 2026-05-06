return {
  "ellisonleao/dotenv.nvim",
  event = "VeryLazy", -- Loads the plugin as soon as Neovim is idle
  config = function()
    require("dotenv").setup({
      enable_on_load = true, -- Automatically load .env file in the current directory
      verbose = false, -- Set to true if you need to debug loading issues
    })
  end,
}
