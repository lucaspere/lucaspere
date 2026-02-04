-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Números relativos: desligar no Visual, ligar no Normal/Insert
vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("UserRelativeNumberVisual", { clear = true }),
  pattern = "*:*",
  callback = function()
    local mode = vim.fn.mode()
    -- Visual: v (charwise), V (linewise), ^V (blockwise = \22)
    if mode == "v" or mode == "V" or mode == "\22" then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
  end,
})
