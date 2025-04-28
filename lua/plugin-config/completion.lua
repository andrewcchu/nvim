local servers = {
    "lua_ls",      -- lua_language_server
    "bashls",      -- bash_language_server
    "pyright",     -- pyright
    "ruff",        -- python linting and formatting
    "texlab",      -- latex editing
    "ltex_plus",   -- latex grammar/spellcheck
    "rust_analyzer", -- rust language server
}

-- Setup Mason and get lang. servers
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
}

-- Set up lspconfig.
local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

require('blink.cmp').setup(
    {
        -- Disable for some filetypes
        enabled = function()
            return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
        end,

        completion = {
            -- Show documentation when selecting a completion item
            documentation = { auto_show = true, auto_show_delay_ms = 500 },

            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = false },

            list = {
                -- Preselect will insert preview with c-e to undo
                selection = { preselect = true, auto_insert = true },
            },

            menu = {
                auto_show = function(ctx) return ctx.mode ~= 'cmdline' end
            },
        },

        sources = {
            -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            -- Disable cmdline completions
            -- cmdline = {},
        },

        cmdline = {
            -- optionally, separate cmdline keymaps
            keymap = {
                preset = 'default',
            }
        },

        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = 'default',
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<Enter>'] = { 'accept', 'fallback' },
        },

        -- Experimental signature help support
        signature = { enabled = true }
    }
)

-- Set up diagnostics for specifics
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
