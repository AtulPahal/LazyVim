return {
  -- Configure Neo-tree to show hidden files and git-ignored files
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently instead of not at all
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            -- ".git",
            -- ".DS_Store",
            -- "thumbs.db",
          },
          never_show = { -- remains hidden even if visible is true
            -- ".DS_Store",
            -- "thumbs.db",
          },
        },
      },
    },
  },
  -- Configure Snacks Picker to show hidden and ignored files by default
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
