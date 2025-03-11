
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

	-- Fuzzy Finder and Picker
	{ 'ibhagwan/fzf-lua', opts = {'skim'} },

	-- Help
	{ 'MunifTanjim/nui.nvim' },
	{ 'm4xshen/hardtime.nvim' },

	-- Themes
	{ 'p00f/alabaster.nvim' },
	{ 'aktersnurra/no-clown-fiesta.nvim' },
}

return Plugins

