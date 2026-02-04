return {
  -- Tokyo Night (optional: switch with :colorscheme tokyonight)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- "storm" | "moon" | "night" | "day"
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      dim_inactive = false,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },

  -- Gruvbox theme (default) — darker background, more contrast (VS Code–like)
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard", -- "hard" = darker bg, "soft" = softer, "" = default
      background = "dark",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}