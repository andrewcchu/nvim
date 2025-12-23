local language_id_mapping = {
    bib = 'bibtex',
    pandoc = 'markdown',
    plaintex = 'tex',
    rnoweb = 'rsweave',
    rst = 'restructuredtext',
    tex = 'latex',
    text = 'plaintext',
}

local function get_language_id(_, filetype)
    return language_id_mapping[filetype] or filetype
end

return {
    -- Command and arguments to start the server.
    cmd = { 'ltex-ls-plus' },

    -- Filetypes to automatically attach to.
    filetypes = { 'tex', 'bib', 'markdown' },

    -- Sets the "root directory" to the parent directory of the file in the
    -- current buffer that contains either a ".luarc.json" or a
    -- ".luarc.jsonc" file. Files that share a root directory will reuse
    -- the connection to the same LSP server.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { '.git', vim.uv.cwd() },

    -- Specific settings to send to the server. The schema for this is
    -- defined by the server. For example the schema for lua-language-server
    -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    get_language_id = get_language_id,
    settings = {
        ltex = {
            enabled = {
                'bib',
                'context',
                'gitcommit',
                'html',
                'markdown',
                'org',
                'pandoc',
                'plaintex',
                'quarto',
                'mail',
                'mdx',
                'rmd',
                'rnoweb',
                'rst',
                'tex',
                'latex',
                'text',
                'typst',
                'xhtml',
            },
            dictionary = {
                ['en-US'] = {
                    'NetShare',
                    'NetSSM',
                    'NetDiffusion',
                    'MIAs',
                    'MIA',
                    'PCAP',
                    'PCAPs',
                    'RPi',
                    'CICIDS',
                    'VCA',
                    'parsability',
                    'logits',
                    'CIFAR',
                    'MNIST',
                    'DoppelGANger',
                    'NetDPSyn',
                    'Wasserstein',
                    'timestep',
                },
            },
        }
    }
}
