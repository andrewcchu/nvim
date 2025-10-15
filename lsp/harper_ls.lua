return {
	-- Command and arguments to start the server.
	cmd = { 'harper-ls', '--stdio' },

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
	settings = {},
	docs = {
		description = [[
https://github.com/automattic/harper

The language server for Harper, the slim, clean language checker for developers.

See our [documentation](https://writewithharper.com/docs/integrations/neovim) for more information on settings.

In short, they should look something like this:
```lua
lspconfig.harper_ls.setup {
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/dict.txt"
    }
  },
}
```
    ]],
	},
}
