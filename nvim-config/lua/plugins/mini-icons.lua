return {
  "nvim-mini/mini.icons",
  version = false,
  event = "VeryLazy",
  opts = {
    style = "glyph", -- or "ascii" if terminal doesn't support Nerd Fonts
  },
  config = function(_, opts)
    require("mini.icons").setup(opts)
  end,
}
