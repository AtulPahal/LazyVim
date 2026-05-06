return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "stepfun_flash",
    -- Performance-focused behaviour
    behaviour = {
      auto_suggestions = false, -- Disable if you only want manual trigger (huge speed boost)
      auto_set_highlight_group = true,
      auto_apply_diff_after_generation = false,
    },
    providers = {
      stepfun_flash = {
        __inherited_from = "openai",
        endpoint = "https://integrate.api.nvidia.com/v1",
        model = "stepfun-ai/step-3.5-flash",
        api_key_name = "NVIDIA_API_KEY",
        extra_request_body = {
          temperature = 0.1, -- Lower temperature = faster, deterministic output
          max_tokens = 1024, -- Lowering this prevents long-winded, slow responses
          top_p = 0.95,
        },
      },
    },
    input = { provider = "snacks" },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to setup/configure render-markdown.nvim
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
    "ellisonleao/dotenv.nvim", -- Ensure this is in your plugin list
  },
}
