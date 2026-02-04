return {
  "echasnovski/mini.surround",
  version = false,
  event = "VeryLazy",
  opts = {
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
    },
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
