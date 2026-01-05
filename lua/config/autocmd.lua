-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Enable autoread and set up checking triggers
vim.api.nvim_create_autocmd("FocusGained", {
    desc = "Reload files from disk when we focus vim",
    pattern = "*",
    command = "if getcmdwintype() == '' | checktime | endif",
    group = aug,
})
vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Every time we enter an unmodified buffer, check if it changed on disk",
    pattern = "*",
    command = "if &buftype == '' && !&modified && expand('%') != '' | exec 'checktime ' . expand('<abuf>') | endif",
    group = aug,
})
