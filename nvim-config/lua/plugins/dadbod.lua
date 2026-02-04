return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
  },
}
