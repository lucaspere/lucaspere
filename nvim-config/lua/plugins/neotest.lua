return {
  "nvim-neotest/neotest",
  event = "LazyFile",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "rouge8/neotest-rust",
  },
  opts = {
    output = { open_on_run = true },
    quickfix = { enabled = true },
  },
  config = function(_, opts)
    local neotest = require("neotest")
    neotest.setup(vim.tbl_deep_extend("force", opts, {
      adapters = { require("neotest-rust") },
    }))
  end,
}
