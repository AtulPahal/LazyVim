return {
  -- LazyVim v11+ uses blink.cmp by default.
  -- We configure it to prioritize LSP (emmet-ls) over snippets.
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            kind = "LSP",
            -- Boost LSP scores so they appear above snippets
            score_offset = 100,
          },
          snippets = {
            name = "snippets",
            enabled = true,
            module = "blink.cmp.sources.snippets",
            kind = "Snippet",
            -- Keep snippets at base score
            score_offset = 0,
          },
        },
      },
      -- Ensure the completion list is sorted by score
      completion = {
        list = {
          selection = { preselect = true, auto_insert = true },
        },
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },
      },
    },
  },
}
