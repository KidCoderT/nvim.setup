return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
		config = function()
			require("toggleterm").setup()
			local Terminal = require("toggleterm.terminal").Terminal

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
				vertical_terminal:toggle()
			end

			function toggle_f()
				floating_terminal:toggle()
			end

			vim.keymap.set("n", "<C-j>", toggle_h, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-l>", toggle_v, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-i>", toggle_f, { noremap = true, silent = true })

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
