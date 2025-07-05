-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Rust Debugger testables" })
map("n", "q", "<Nop>") -- Disable 'q' to prevent recording macros
map("n", "m", "<Nop>") -- Disable 'm' to prevent marking positions
