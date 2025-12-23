-- Rebind keys to mimic navigation and edit behavior of hardwrap for softwrap
local opts = { buffer = true, desc = "LaTeX specific keybinds" }
vim.keymap.set({ "n", "v" }, "j", "gj", opts)
vim.keymap.set({ "n", "v" }, "k", "gk", opts)
vim.keymap.set({ "n", "v" }, "$", "g$", opts)
vim.keymap.set({ "n", "v" }, "0", "g0", opts)
vim.keymap.set({ "n", "v" }, "^", "g^", opts)
vim.keymap.set("n", "A", "g$a", opts)
vim.keymap.set("n", "I", "g^i", opts)

-- Colorscheme switch
local colorscheme = "srcery"
local ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not ok then
    print("error setting colorscheme")
end
require('lualine').setup(require('plugins.nvim-lualine'))

-- TeXpresso
require('config.texpresso').attach()
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "InsertLeave" }, {
    group = vim.api.nvim_create_augroup('texpressoGroup', {}),
    callback = function()
        vim.cmd("TeXpressoSync")
    end
})

-- Toggle latexindent for the current buffer
vim.api.nvim_buf_create_user_command(0, 'ToggleLatexIndent', function()
    -- Get the active texlab client for the current buffer
    local client = vim.lsp.get_clients({ bufnr = 0, name = 'texlab_ls' })[1]
    if not client then
        vim.notify("Texlab client not found", vim.log.levels.WARN)
        return
    end

    -- Access current settings
    local settings = client.config.settings
    -- Ensure the settings table exists
    settings.texlab = settings.texlab or {}

    -- Toggle between 'latexindent' and 'none'
    if settings.texlab.latexFormatter == 'latexindent' then
        settings.texlab.latexFormatter = 'none'
        vim.notify("Texlab: latexindent disabled", vim.log.levels.INFO)
    else
        settings.texlab.latexFormatter = 'latexindent'
        vim.notify("Texlab: latexindent enabled", vim.log.levels.INFO)
    end

    -- Update the client's internal config
    client.config.settings = settings

    -- Notify the LSP server of the configuration change
    client.notify('workspace/didChangeConfiguration', { settings = settings })
end, { desc = "Toggle latexindent" })
