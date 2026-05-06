return {
  -- 1. Disable Mason's auto-installation feature
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Clear the ensure_installed list so nothing is added automatically
      opts.ensure_installed = {}
    end,
  },

  -- 2. Disable mason-lspconfig's automatic installation
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
    },
  },

  -- 3. Disable mason-nvim-dap automatic installation
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = {
      automatic_installation = false,
      ensure_installed = {},
    },
  },

  -- 4. Also prevent conform.nvim (formatter) from ensuring installations
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      -- This ensures conform doesn't try to install anything via Mason
      opts.formatters_by_ft = opts.formatters_by_ft or {}
    end,
  },
}
