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
    vim.lsp.enable('digestif_ls')
    vim.lsp.enable('ltex_plus_ls')
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf

        -- Completion help trigger
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Signature help trigger
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_signatureHelp) then
            local group = vim.api.nvim_create_augroup('LspSignatureHelp', { clear = true })
            vim.api.nvim_create_autocmd('TextChangedI', {
                group = group,
                buffer = bufnr,
                callback = function()
                    -- Check if the last character typed is a trigger character
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    local line_text = vim.api.nvim_buf_get_lines(bufnr, line - 1, line, true)[1]
                    local char = string.sub(line_text, col, col)

                    -- Trigger on characters like '{' for LaTeX commands or '(' for functions
                    if char == '{' or char == '(' then
                        vim.lsp.buf.signature_help()
                    end
                end,
            })
        end

        -- Keymap to manually trigger completion help
        vim.keymap.set('i', '<C-c>', function()
            vim.lsp.completion.get()
        end, { buffer = bufnr })

        -- Keymap to manually trigger signature help
        vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
    end,
})

-- Diagnostics
vim.diagnostic.config({
    -- Use the default configuration
    virtual_lines = false,
    virtual_text = false,
})
