return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	mappings = {
		i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<C-h>"] = "which_key",
		},
	},

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

		-- vim.keymap.set('n', '<leader>fw', function()
		--     local word = vim.fn.expand("<cword>")
		--     builtin.grep_string({ search = word })
		-- end)
		-- vim.keymap.set('n', '<leader>fW', function()
		--     local word = vim.fn.expand("<cWORD>")
		--     builtin.grep_string({ search = word })
		-- end)

		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
