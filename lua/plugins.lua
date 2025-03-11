
Plugins = {
	-- Text
	{ 'echasnovski/mini.surround', version = false },
	{ 'jake-stewart/multicursor.nvim' },

	-- Wrapping
	{ 'andrewferrier/wrapping.nvim' },

	-- Completions
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'saghen/blink.cmp', version = '*', build = 'cargo build --locked --release --target-dir target' },

	-- Syntax
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- Selection
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },

	-- Themes
	{ 'p00f/alabaster.nvim' },
	{ 'aktersnurra/no-clown-fiesta.nvim' },
}

return Plugins

