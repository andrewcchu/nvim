
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
	{ 'saghen/blink.cmp', build = 'cargo build --release' },

	-- Syntax
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'RRethy/vim-illuminate' },

	-- Selection
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },

	-- Fuzzy Finder and Picker
	{ 'ibhagwan/fzf-lua', opts = {'skim'} },

	-- Themes
	{ 'p00f/alabaster.nvim' },
	{ 'aktersnurra/no-clown-fiesta.nvim' },
	{ 'ramojus/mellifluous.nvim' },
	{ 'https://gitlab.com/bartekjaszczak/finale-nvim' },
}

return Plugins

