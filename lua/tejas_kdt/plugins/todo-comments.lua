local keywords = {
	TODO = { color = "#FF8C00" },
	DONE = { icon = "", color = "#358a14" }, -- nf-md-check
	TEST = { icon = "", color = "#ffffff", alt = { "TESTING" } }, -- nf-md-hammer
	FIX = { alt = { "FIXME", "ERROR" } },
	NOTE = { icon = "?", color = "#3498DB" },
	-- ERROR = { icon = "", color = "#FF0000", alt = {} },
}

return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = keywords,
		},
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>T", "<cmd>TodoQuickFix<cr>", { desc = "Show all Todos" })
		end,
	},
}

-- PERF:
-- CHECK THIS OUT

-- HACK:
-- Another Thing

-- TODO:
-- Hmmm

-- NOTE:
-- Crazy Right

-- FIX:
-- URGENT!!

-- WARNING: ???
-- Wow

-- TODO: HELLO WORLD
-- FIXME: URGENT BOY

-- DONE: IT WORKS

-- ERROR: CHECK THIS STUFF

-- NOTE: NOTES HECK YEAH
-- PERF: IDK LA
-- HACK: ME HACKER BOI
-- TEST: HM
--
-- ERROR: YOO
