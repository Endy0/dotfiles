-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

-- LSP server list
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
local lsp_servers = {
  'lua_ls',
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = lsp_servers,
    })

    for _, lsp_server in ipairs(lsp_servers) do
      require('lspconfig')[lsp_server].setup({})
    end

    vim.keymap.set('n', '<leader>d', '<cmd>:lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', '<leader>r', '<cmd>:lua vim.lsp.buf.references()<CR>')
    vim.keymap.set('n', '<leader>R', '<cmd>:lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n', '<leader>h', '<cmd>:lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<leader>f', '<cmd>:lua vim.lsp.buf.formatting()<CR>')
  end,
}
