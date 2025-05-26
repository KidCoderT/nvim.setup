function ColorMyPencils(color, transparent_bg)
	color = color
	vim.cmd.colorscheme(color)

	clear_bg = transparent_bg or false
	if clear_bg then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end

	vim.cmd([[
        highlight! link CmpItemAbbr Normal
        highlight! link CmpItemAbbrMatch Normal
        highlight! link CmpItemAbbrMatchFuzzy Normal
        highlight! link CmpItemKind Normal
        highlight! link CmpItemMenu Normal
    ]])
end

colorschemes = {
	"habamax",
	"desert",
	"slate",
	"sorbet",
	"unokai",
	"monokai-pro",
	"tokyonight-moon",
	"gruvbox",
}

function Paint(decidedColor)
	color = decidedColor or colorschemes[math.random(#colorschemes)]
	vim.cmd.colorscheme(color)

	print(color)

	vim.cmd([[
        highlight! link CmpItemAbbr Normal
        highlight! link CmpItemAbbrMatch Normal
        highlight! link CmpItemAbbrMatchFuzzy Normal
        highlight! link CmpItemKind Normal
        highlight! link CmpItemMenu Normal
    ]])
end

return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				-- transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})

			-- ColorMyPencils("tokyonight")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})

			-- vim.cmd("colorscheme rose-pine")
			-- ColorMyPencils()
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai-pro",
		config = function()
			require("monokai-pro").setup()
			ColorMyPencils("monokai-pro")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "morhetz/gruvbox", name = "gruvbox" },
}
