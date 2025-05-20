return {{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },

  config =  function()
    require("neo-tree").setup({
      filesystem = {
            hijack_netrw_behavior = "open_current", -- Always open in the current window
  },
    window = {
        mappings = {
          ["E"] = function(state)
            local function expand_all(node)
              if node.type == "directory" and not node:is_expanded() then
                require("neo-tree.sources.filesystem.commands").toggle_node(state, node)
              end
              if node.children then
                for _, child in ipairs(node.children) do
                  expand_all(child)
                end
              end
            end
            for _, node in ipairs(state.tree.nodes) do
              expand_all(node)
            end
          end,
        },
      },

  })
    vim.keymap.set("n", "<leader>pv", ":Neotree position=current<CR>", { desc = "Toggle Neo-tree (default position)" })
    vim.keymap.set("n", "<leader>pf", ":Neotree position=float<CR>", { desc = "Open the file" })
  end
}}
