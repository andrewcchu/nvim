Plugins = {
	-- Text
	{ 'echasnovski/mini.surround', version = false },
	{ 'jake-stewart/multicursor.nvim' },

	-- Wrapping
	{ 'andrewferrier/wrapping.nvim' },

	-- Hints
	{ 'tris203/precognition.nvim' },

	-- Completions
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'saghen/blink.cmp', version = '1.*', build = 'cargo build --release' },

	-- Syntax
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'RRethy/vim-illuminate' },

	-- Selection
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },

	-- Fuzzy Finder and Picker
	{ 'ibhagwan/fzf-lua', opts = {'skim'} },

	-- Cursor Smearing
	{ 'sphamba/smear-cursor.nvim', opts = {stiffness = 0.5, trailing_stiffness = 0.49, never_draw_over_target = false}},

	-- Themes
	{ 'p00f/alabaster.nvim' },
}

return Plugins
