-- Colorscheme switch
local colorscheme = "srcery"
local ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not ok then
    print("error setting colorscheme")
end

-- TeXpresso
require('texpresso').attach()
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "InsertLeave" }, {
    group = vim.api.nvim_create_augroup('texpressoGroup', {}),
    callback = function()
        vim.cmd("TeXpressoSync")
    end
})
