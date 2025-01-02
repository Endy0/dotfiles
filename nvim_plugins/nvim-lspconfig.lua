-- https://github.com/neovim/nvim-lspconfig
return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').lua_ls.setup{}
    vim.keymap.set('n', '<leader>d', '<cmd>:lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', '<leader>r', '<cmd>:lua vim.lsp.buf.references()<CR>')
    vim.keymap.set('n', '<leader>R', '<cmd>:lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n', '<leader>h', '<cmd>:lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<leader>f', '<cmd>:lua vim.lsp.buf.formatting()<CR>')
  end,
}
