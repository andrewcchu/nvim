-- Set visual soft-wrapping to 80 columns for TeX files
vim.opt_local.columns = 100
-- vim.opt_local.textwidth = 80

-- Let j and k move up and down lines that have been wrapped
local opts = { buffer = true, desc = "LaTeX specific keybinds" }
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Apply a custom lualine configuration ONLY for TeX files
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16,
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'diagnostics' },
        lualine_x = {},
        lualine_y = { 'diff' },
        lualine_z = { 'branch' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

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
