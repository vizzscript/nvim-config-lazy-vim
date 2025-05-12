-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keymaps.lua
local Terminal = require("toggleterm.terminal").Terminal

-- Create the bottom terminal (main terminal)
local term_bottom = Terminal:new({
  direction = "horizontal", -- Horizontal split at the bottom
  id = 1, -- Ensure this is the main terminal
  start_in_insert = true, -- Start terminal in insert mode
})

-- Keymap for toggling the bottom terminal (main terminal)
vim.keymap.set("n", "<leader>tb", function()
  term_bottom:toggle() -- Open/close the bottom terminal
end, { desc = "Toggle Bottom Terminal" })

-- Initialize terminal counter for vertical splits
local term_counter = 2 -- Start counting for vertical terminals

-- Function to create and toggle new vertical terminals dynamically
function _G.toggle_new_vertical_terminal()
  local new_term = Terminal:new({
    direction = "vertical", -- Vertical split on the right
    id = term_counter, -- Unique ID for new terminals
    start_in_insert = true, -- Start terminal in insert mode
  })
  new_term:toggle() -- Toggle the new terminal
  term_counter = term_counter + 1 -- Increment terminal counter for the next terminal
end

-- Keymap for auto import missing libraries in Java.
vim.keymap.set("n", "<leader>ai", vim.lsp.buf.code_action, { desc = "LSP Code Action (Auto Import)" })

-- Keymap for running java files
vim.keymap.set("n", "<leader>rj", function()
  local filename = vim.fn.expand("%")
  local classname = vim.fn.fnamemodify(filename, ":r")
  vim.cmd("TermExec cmd='javac " .. filename .. " && java " .. classname .. "'")
end, { desc = "Run Java in Terminal" })

-- Keymap for toggling vertical terminals (sub terminals)
vim.keymap.set("n", "<leader>tr", function()
  _G.toggle_new_vertical_terminal() -- Open a new vertical terminal
end, { desc = "Toggle Vertical Terminal" })
