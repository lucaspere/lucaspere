return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerRun",
    "OverseerQuickAction",
    "OverseerBuild",
    "OverseerTaskAction",
  },
  opts = {},
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer run task" },
    { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Overseer task list" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Overseer quick action" },
  },
}
