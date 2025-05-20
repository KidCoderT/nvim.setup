vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]], {desc="paste without copying what was in place"})

vim.keymap.set("i", "<C-c>", "<Esc>", {desc="press escape"})
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {desc="escape terminal insert mode"})

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
