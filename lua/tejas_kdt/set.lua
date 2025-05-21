vim.opt.clipboard = "unnamedplus"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.termguicolors = true

vim.g.wilmenu = true
vim.o.undofile = true
local home = os.getenv("HOME") or os.getenv("USERPROFILE") or
(os.getenv("HOMEDRIVE") and os.getenv("HOMEPATH") and (os.getenv("HOMEDRIVE") .. os.getenv("HOMEPATH")))
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50

vim.opt.list = false
vim.o.mouse = "a"
vim.o.breakindent = true

vim.o.smartcase = true
vim.o.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
