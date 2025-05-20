return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
			{ "<C-x>", "<Cmd>bdelete<CR>", desc = "Close Tab" },
		},
		opts = {
			options = {
				separator_style = "slant", -- or "thick", "thin", "padded_slant", "slope", "none"
				-- mode = "tabs",
				-- -- separator_style = "slant",
				-- show_buffer_close_icons = false,
				-- show_close_icon = false,
			},
		},
	},
}
