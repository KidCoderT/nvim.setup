return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support
  },
  lazy = false, -- neo-tree will NOT load lazily
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "open_current", -- Always open in the current window
        filtered_items = {
          hide_gitignored = false,
          hide_dotfiles = false,
        },
      },
      window = {
        mappings = {
["E"] = function(state)
  local function open_all_files(node)
    if node.type == "file" then
      -- Open the file in a new buffer
      vim.cmd("edit " .. node.path)
    elseif node.type == "directory" and node.children then
      for _, child in ipairs(node.children) do
        open_all_files(child)
      end
    end
  end
  for _, node in ipairs(state.tree.nodes) do
    open_all_files(node)
  end
end,
        },
      },
    })
    vim.keymap.set("n", "<leader>pv", ":Neotree position=current<CR>", { desc = "Toggle Neo-tree (current window)" })
    vim.keymap.set("n", "<leader>pf", ":Neotree position=float<CR>", { desc = "Open Neo-tree (float)" })
  end,
}
