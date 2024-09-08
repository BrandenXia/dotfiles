-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(func, func_param_table)
  for _, v in ipairs(func_param_table) do
    func(unpack(v))
  end
end

local deleted_keymaps = {
  { { "n", "v", "i" }, "<A-j>" },
  { { "n", "v", "i" }, "<A-k>" },
}

local added_keymaps = {
  { "n", "<A-j>", "5j", { desc = "Down" } },
  { "n", "<A-k>", "5k", { desc = "Up" } },
  { "n", "<A-h>", "b", { desc = "Left" } },
  { "n", "<A-l>", "w", { desc = "Right" } },
  { "i", "<A-j>", "<esc>5ji", { desc = "Down" } },
  { "i", "<A-k>", "<esc>5ki", { desc = "Up" } },
  { "i", "<A-h>", "<esc>bi", { desc = "Left" } },
  { "i", "<A-l>", "<esc> wi", { desc = "Right" } },
  { "n", "<S-A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" } },
  { "n", "<S-A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" } },
  { "i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" } },
  { "i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" } },
  { "v", "<S-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" } },
  { "v", "<S-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" } },
  { "i", "<Esc><BS>", "<C-w>", { desc = "Delete previous word" } },
}

map(vim.keymap.del, deleted_keymaps)
map(vim.keymap.set, added_keymaps)
