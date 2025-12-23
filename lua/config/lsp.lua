-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- Enable lsps
vim.lsp.enable('lua_ls')
vim.lsp.enable('bash_ls')
vim.lsp.enable('python_ls')

-- LaTeX only on macOS
if vim.fn.has('macunix') then
    vim.lsp.enable('texlab_ls')
    vim.lsp.enable('harper_ls')
    vim.lsp.enable('ltex_plus_ls')
end
