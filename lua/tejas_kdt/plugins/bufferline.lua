return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
			{ "<C-x>", "<Cmd>bdelete<CR>", desc = "Close Tab" },
			{ "<C-X>", "<Cmd>bdelete!<CR>", desc = "Close Tab Without Saving" },
		},
		---@module "bufferline"
		---@type bufferline.Config
		opts = {
			options = {
				-- separator_style = { "|", "|" },
				indicator = {
					style = "none",
				},
				-- separator_style = "slope", -- or "thick", "thin", "padded_slant", "slope", "none", "padded_slope"
				-- mode = "tabs",
				-- -- separator_style = "slant",
				-- show_buffer_close_icons = false,
				-- show_close_icon = false,
			},
		},
	},
}
