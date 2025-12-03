-- https://github.com/mason-org/mason-lspconfig.nvim
-- https://github.com/mason-org/mason.nvim
-- https://github.com/neovim/nvim-lspconfig

-- LSP server list installed by mason automatically
-- https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
local mason_lsp_servers = {
  'lua_ls',
  'clangd',
  'ts_ls',
  'svls',
}

return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = mason_lsp_servers,
      automatic_enable = true,
    })

    -- only rust-analyzer was installed by using rustup, not mason
    -- vim.lsp.config('rust_analyzer', {})
    vim.lsp.enable({'rust_analyzer'})

    vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
    vim.keymap.set('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  end,
}
