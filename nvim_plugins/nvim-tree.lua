-- https://github.com/nvim-tree/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    {mode = 'n', '<leader>n', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTreeをトグル'},
    {mode = 'v', '<leader>n', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTreeをトグル'},
  },
  opts = {
    view = {
      width = 40,
    },
  },
}
