return {
	"LintaoAmons/bookmarks.nvim",
	tag = "v4.0.0",
	dependencies = {
		{
			"kkharji/sqlite.lua",
			init = function()
				vim.g.sqlite_clib_path = [[C:\Users\tejas_uvx2fi9\sqlite-dll\sqlite3.dll]]
			end,
		},
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("bookmarks").setup({
			picker = {
				picker_backend = "telescope",
			},

			-- ── Treeview keybindings ──────────────────────────────────────────
			-- v4.0.0 uses the OLD string-based keymap format:
			--   action_name = "key_or_list_of_keys"
			-- The NEW {action=, desc=} table format is main-branch only.
			--
			-- Solution: reassign "goto" to "<CR>" and keep "toggle" on "o".
			-- Now Enter jumps to the bookmark; "o" still expands/collapses lists.
			keymap = {
				quit = {}, -- "q", "<ESC>" },
				refresh = "R",
				create_list = "a",
				level_up = "u",
				set_root = ".",
				set_active = "m",
				toggle = "o", -- expand/collapse list (was also default for Enter)
				move_up = "<leader>k",
				move_down = "<leader>j",
				delete = "D",
				rename = "r",
				["goto"] = "<leader>", -- ← Enter now navigates to the bookmark
				cut = "x",
				copy = "c",
				paste = "p",
				show_info = "i",
				reverse = "t",
			},
		})

		-- ── Smart named toggle (mb) ───────────────────────────────────────────
		-- The "commands" table in setup() registers entries for :BookmarksCommands.
		-- Calling require("bookmarks.commands")["Named Mark"]() fails because that
		-- key only exists for built-in commands, not user-registered ones.
		-- Fix: define the function directly and call it from the keymap.
		local function named_mark_toggle()
			local Service = require("bookmarks.domain.service")
			local sign = require("bookmarks.sign")

			local current_line = vim.fn.line(".")
			local current_file = vim.fn.expand("%:p")
			local existing = nil

			-- Walk the active list's bookmarks to see if this line is already marked.
			pcall(function()
				local repo = require("bookmarks.domain.bookmark_repo")
				local marks = repo.find_all()
				for _, m in ipairs(marks or {}) do
					if m.filename == current_file and m.line == current_line then
						existing = m
						break
					end
				end
			end)

			if existing then
				-- Already bookmarked → confirm deletion
				vim.ui.select({ "Yes", "No" }, {
					prompt = string.format(
						'Remove bookmark "%s" on line %d?',
						(existing.name ~= nil and existing.name ~= "") and existing.name or "(unnamed)",
						current_line
					),
				}, function(choice)
					if choice == "Yes" then
						-- Calling toggle_mark("") signals the plugin to delete the mark.
						Service.toggle_mark("")
						sign.safe_refresh_signs()
						vim.notify("Bookmark removed.", vim.log.levels.INFO)
					end
				end)
			else
				-- Not yet bookmarked → prompt for a name/description first
				vim.ui.input({ prompt = "Bookmark name/desc (Enter to skip): " }, function(input)
					if input == nil then
						return
					end -- <Esc> cancels
					local name = vim.trim(input)
					-- Pass nil when blank so the plugin uses its default unnamed behaviour.
					Service.toggle_mark(name ~= "" and name or nil)
					sign.safe_refresh_signs()
					vim.notify(
						name ~= "" and ('Bookmark saved: "' .. name .. '"') or "Bookmark saved (unnamed).",
						vim.log.levels.INFO
					)
				end)
			end
		end

		-- ── User commands ─────────────────────────────────────────────────────

		-- :BookmarksClearCurrentFile – remove all marks in the current file
		vim.api.nvim_create_user_command("BookmarksClearCurrentFile", function()
			require("bookmarks.commands")["Delete marks of current file"]()
		end, { desc = "Remove all bookmarks in the current file" })

		-- :BookmarkAdd – always-add with a name prompt (no toggle behaviour)
		vim.api.nvim_create_user_command("BookmarkAdd", function()
			vim.ui.input({ prompt = "Bookmark name/desc (Enter to skip): " }, function(input)
				if input == nil then
					return
				end
				local name = vim.trim(input)
				local Service = require("bookmarks.domain.service")
				Service.toggle_mark(name ~= "" and name or nil)
				require("bookmarks.sign").safe_refresh_signs()
				vim.notify(
					name ~= "" and ('Bookmark saved: "' .. name .. '"') or "Bookmark saved (unnamed).",
					vim.log.levels.INFO
				)
			end)
		end, { desc = "Add a named bookmark on the current line" })

		-- ── Keymaps ───────────────────────────────────────────────────────────

		-- mb  – smart toggle: prompts for name on add, confirms before delete
		vim.keymap.set({ "n", "v" }, "mb", named_mark_toggle, { desc = "Toggle named bookmark on current line" })

		-- bb  – treeview (Enter jumps, o expands/collapses)
		vim.keymap.set({ "n", "v" }, "<leader>bb", "<cmd>BookmarksTree<cr>", { desc = "Open bookmark treeview" })

		-- fb  – Telescope picker for ALL bookmarks across lists
		-- BookmarksGoto only searches the *active* list.
		-- BookmarksCommands lets you pick any command, including "Goto" which
		-- opens the full picker.  The dedicated picker command is BookmarksMark
		-- (which also opens Telescope when a mark already exists on the line).
		-- The cleanest approach: call the picker directly via the telescope extension.
		vim.keymap.set({ "n", "v" }, "fb", function()
			-- Try the Telescope extension entry point first (registered by the plugin).
			local ok = pcall(function()
				require("telescope").extensions.bookmarks.list()
			end)
			if not ok then
				-- Fallback: the built-in picker command (searches active list)
				vim.cmd("BookmarksGoto")
			end
		end, { desc = "Search all bookmarks with Telescope" })

		-- ab  – explicit add with name prompt (never removes)
		vim.keymap.set(
			{ "n", "v" },
			"ab",
			"<cmd>BookmarkAdd<cr>",
			{ desc = "Add a named bookmark on the current line" }
		)
	end,
}
