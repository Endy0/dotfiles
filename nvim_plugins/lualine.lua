-- https://github.com/nvim-lualine/lualine.nvim
return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = { theme = 'ayu_dark' },
    tabline = {
      lualine_a = {
        {
          'buffers',
          mode = 4
        }
      }
    }
  }
}
