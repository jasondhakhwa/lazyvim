-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Automatically choose (E)dit anyway if a swap file exists
vim.api.nvim_create_autocmd("SwapExists", {
  group = vim.api.nvim_create_augroup("auto_edit_swap", { clear = true }),
  callback = function()
    vim.v.swapchoice = "e"
  end,
})
