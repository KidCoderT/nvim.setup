return {
	{

		{
			"nvim-lua/plenary.nvim",
			name = "plenary",
		},

		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	"folke/which-key.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = false, opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true, -- or config = function() require("nvim-autopairs").setup {} end
	},
}
