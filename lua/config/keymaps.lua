-- ~/.config/nvim/lua/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Exit insert mode with kj
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })

-- Delete previous/next word (VSCode-style)
vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("i", "<C-l>", "<C-o>dw", { desc = "Delete next word" })

-- Move 7 lines up/down with H/L
vim.keymap.set("n", "H", "7k", { noremap = true, silent = true, desc = "Move 7 lines up" })
vim.keymap.set("n", "L", "7j", { noremap = true, silent = true, desc = "Move 7 lines down" })

--------------------------------------------------------------------------------
-- SNACKS PICKER (Old)
--------------------------------------------------------------------------------
local picker = function()
  require("snacks").picker("files")
end

vim.keymap.set({ "n", "i", "v" }, "<C-p>", picker, { desc = "Find files (Snacks)" })
vim.keymap.set("t", "<C-p>", function()
  vim.cmd("stopinsert") -- exit terminal insert mode
  picker()
end, { desc = "Find files (Snacks)" })



--------------------------------------------------------------------------------
-- SEARCH MAPPING (Ctrl+Shift+F)
--------------------------------------------------------------------------------
vim.schedule(function()
  -- remove old mapping if exists
  pcall(vim.keymap.del, "n", "<C-S-F>")

  -- map to <leader>sg (root search)
  vim.keymap.set("n", "<C-S-F>", "<leader>sg", {
    desc = "Root-level search (VSCode-style Ctrl+Shift+F)",
    remap = true,
  })
end)


--------------------------------------------------------------------------------
-- ORGANIZE IMPORTS (Alt + Shift + O)
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set("n", "<A-S-o>", function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(action)
          return action.kind == "source.organizeImports"
              or action.kind == "source.sortImports"
        end,
      })
    end, { buffer = bufnr, desc = "Organize Imports (Alt+Shift+O)" })
  end,
})


-- Log the word under cursor
vim.keymap.set("n", "<C-S-l>", function()
  local word = vim.fn.expand("<cword>")
  vim.api.nvim_put({ 'console.log("' .. word .. ':", ' .. word .. ');' }, "l", true, true)
end)

-- Log the visual selection
vim.keymap.set("v", "<C-S-l>", function()
  local _, ls, cs = unpack(vim.fn.getpos("'<"))
  local _, le, ce = unpack(vim.fn.getpos("'>"))
  local lines = vim.fn.getline(ls, le)
  lines[1] = string.sub(lines[1], cs)
  lines[#lines] = string.sub(lines[#lines], 1, ce)
  local selection = table.concat(lines, "\n")

  vim.api.nvim_put({ 'console.log("' .. selection .. ':", ' .. selection .. ');' }, "l", true, true)
end)
