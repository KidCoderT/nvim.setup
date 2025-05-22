return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
		config = function()
			require("toggleterm").setup()
			local Terminal = require("toggleterm.terminal").Terminal

			-- Move even inside the terminal
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			-- Toggalable Terminals

			local horiz_terminal = Terminal:new({
				direction = "horizontal",
				hidden = "true",
				count = 1,
			})

			local vertical_terminal = Terminal:new({
				direction = "vertical",
				hidden = "true",
				count = 2,
			})

			local floating_terminal = Terminal:new({
				direction = "float",
				hidden = "true",
				count = 3,
			})

			function toggle_h()
				horiz_terminal:toggle()
			end

			function toggle_v()
				vertical_terminal:toggle(50)
			end

			function toggle_f()
				floating_terminal:toggle()
			end

			vim.keymap.set("n", "<leader>th", toggle_h, { noremap = true, silent = true })
			vim.keymap.set("n", "<A-h>", toggle_h, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tv", toggle_v, { noremap = true, silent = true })
			vim.keymap.set("n", "<A-v>", toggle_v, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tf", toggle_f, { noremap = true, silent = true })
			vim.keymap.set("n", "<A-f>", toggle_f, { noremap = true, silent = true })

			-- LazyGit in LUA
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
