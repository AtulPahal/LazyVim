return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  config = function(_, opts)
    -- Parse MODEL environment variable
    local model_env = os.getenv("MODEL") or "open_router/anthropic/claude-3.5-sonnet"
    local provider_type, model_name = model_env:match("([^/]+)/(.*)")
    
    if not provider_type or not model_name then
      provider_type = "open_router"
      model_name = model_env
    end

    opts.provider = provider_type

    opts.providers = {
      open_router = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = provider_type == "open_router" and model_name or "anthropic/claude-3.5-sonnet",
        api_key_name = "OPENROUTER_API_KEY",
      },
      nvidia_nim = {
        __inherited_from = "openai",
        endpoint = "https://integrate.api.nvidia.com/v1",
        model = provider_type == "nvidia_nim" and model_name or "meta/llama3-70b-instruct",
        api_key_name = "NVIDIA_NIM_API_KEY",
      },
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com/v1",
        model = provider_type == "deepseek" and model_name or "deepseek-coder",
        api_key_name = "DEEPSEEK_API_KEY",
      },
      lmstudio = {
        __inherited_from = "openai",
        endpoint = os.getenv("LM_STUDIO_BASE_URL") or "http://localhost:1234/v1",
        model = provider_type == "lmstudio" and model_name or "local-model",
        api_key_name = "OPENROUTER_API_KEY", -- dummy since openai provider might require it
      },
      llamacpp = {
        __inherited_from = "openai",
        endpoint = os.getenv("LLAMACPP_BASE_URL") or "http://localhost:8080/v1",
        model = provider_type == "llamacpp" and model_name or "local-model",
        api_key_name = "OPENROUTER_API_KEY", -- dummy
      },
      ollama = {
        __inherited_from = "openai",
        endpoint = (os.getenv("OLLAMA_BASE_URL") or "http://localhost:11434") .. "/v1",
        model = provider_type == "ollama" and model_name or "llama3",
        api_key_name = "OPENROUTER_API_KEY", -- dummy
      }
    }

    require("avante").setup(opts)
  end,
  opts = {
    -- Performance-focused behaviour
    behaviour = {
      auto_suggestions = false, -- Disable if you only want manual trigger (huge speed boost)
      auto_set_highlight_group = true,
      auto_apply_diff_after_generation = false,
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
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
