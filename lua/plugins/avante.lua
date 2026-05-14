return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  config = function(_, opts)
    -- Parse MODEL environment variable (format: provider/model)
    local model_env = os.getenv("MODEL") or "open_router/anthropic/claude-3.5-sonnet"
    local provider_key, model_name = model_env:match("([^/]+)/(.*)")

    if not provider_key or not model_name then
      -- Fallback or handle cases where only model is provided (e.g. for default provider)
      provider_key = model_env:match("^opencode$") or "open_router"
      model_name = model_env
    end

    -- Map friendly names to avante provider keys
    local provider_map = {
      claude = "anthropic",
      gemini = "google",
      opencode = "opencode",
    }

    local avante_provider = provider_map[provider_key] or provider_key
    opts.provider = avante_provider

    opts.providers = {
      openai = {
        model = provider_key == "openai" and model_name or "gpt-4o",
      },
      anthropic = {
        model = (provider_key == "claude" or provider_key == "anthropic") and model_name or "claude-3-5-sonnet-20240620",
      },
      google = {
        model = (provider_key == "gemini" or provider_key == "google") and model_name or "gemini-1.5-pro-latest",
      },
      open_router = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = provider_key == "open_router" and model_name or "anthropic/claude-3.5-sonnet",
        api_key_name = "OPENROUTER_API_KEY",
      },
      nvidia_nim = {
        __inherited_from = "openai",
        endpoint = "https://integrate.api.nvidia.com/v1",
        model = provider_key == "nvidia_nim" and model_name or "meta/llama3-70b-instruct",
        api_key_name = "NVIDIA_NIM_API_KEY",
      },
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com/v1",
        model = provider_key == "deepseek" and model_name or "deepseek-coder",
        api_key_name = "DEEPSEEK_API_KEY",
      },
      lmstudio = {
        __inherited_from = "openai",
        endpoint = os.getenv("LM_STUDIO_BASE_URL") or "http://localhost:1234/v1",
        model = provider_key == "lmstudio" and model_name or "local-model",
        api_key_name = "DUMMY_KEY",
      },
      llamacpp = {
        __inherited_from = "openai",
        endpoint = os.getenv("LLAMACPP_BASE_URL") or "http://localhost:8080/v1",
        model = provider_key == "llamacpp" and model_name or "local-model",
        api_key_name = "DUMMY_KEY",
      },
      ollama = {
        __inherited_from = "openai",
        endpoint = (os.getenv("OLLAMA_BASE_URL") or "http://localhost:11434") .. "/v1",
        model = provider_key == "ollama" and model_name or "llama3",
        api_key_name = "DUMMY_KEY",
      },
    }

    -- Support for OpenCode via ACP
    opts.acp_providers = {
      ["opencode"] = {
        command = "gemini",
        args = { "--acp" },
        env = {
          NODE_NO_WARNINGS = "1",
        },
      },
    }

    require("avante").setup(opts)
  end,
  opts = {
    behaviour = {
      auto_suggestions = false,
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
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
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
