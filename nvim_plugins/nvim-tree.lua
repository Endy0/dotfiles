-- https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  -- https://github.com/nvim-tree/nvim-web-devicons
  dependencies = {"nvim-tree/nvim-web-devicons"},
  keys = {
    {mode = "n", "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグル"},
  },
  opts = {
    view = {
      width = 40,
    },
  },
}
