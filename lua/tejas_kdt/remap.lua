vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set("n", "<C-a>", function()
  local total_width = vim.api.nvim_get_option("columns")
  local width = math.floor(total_width * 0.25)
  vim.cmd("rightbelow vsplit")
  vim.cmd("vertical resize " .. width)
  vim.cmd("terminal")
end, { desc = "Open new terminal buffer to right" })

vim.keymap.set("n", "<C-h>", function()
  local total_height = vim.o.lines
  local height = math.floor(total_height * 0.25)
  vim.cmd("rightbelow split")
  vim.cmd("resize " .. height)
  vim.cmd("terminal")
end, { desc = "Open new terminal buffer below" })
