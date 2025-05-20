return {
	{
		"gelguy/wilder.nvim",
		lazy = false,
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				})
			)

			wilder.set_option("pipeline", {
				wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					border = "rounded", -- options: 'single', 'double', 'rounded', 'solid'
					highlighter = wilder.basic_highlighter(),
				}))
			)
		end,
	},
}
