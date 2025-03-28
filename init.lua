-- Inspiration: https://github.com/tuna-f1sh/dotfiles/blob/master/config/nvim/init.lua

-- Paq installation
local paq_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
local paq_installed = vim.fn.empty(vim.fn.glob(paq_path)) == 0

local function clone_paq()
	if not paq_installed then
		vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", paq_path }
		return true
	end
end

local function bootstrap_paq()
	local first_install = clone_paq()
	vim.cmd.packadd("paq-nvim")
	local paq = require("paq")
	return first_install, paq
end

local function install_plugins(paq, first_install, plugins)
	-- Read and install plugins
	paq(plugins)

	if first_install then
		paq.install()
	end
end

-- [[ Setup ]]
local first_install, paq = bootstrap_paq()
install_plugins(paq, first_install, require('plugins'))

-- If this is the first install, notify and exit the configuration.
if first_install then
  vim.notify("Plugins are being installed. Please restart Neovim once more...", vim.log.levels.INFO)
  return
end

-- [[ Plugins ]]
require('mini.surround').setup()
require('wrapping').setup({create_keymaps=false})
require('fzf-lua').setup({'skim'})
require('plugin-config/treesitter')
require('plugin-config/completion')
require('plugin-config/multicursor')

-- [[ Global commands ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.tex_flavor = 'latex'

-- [[ General configuration ]]
require('options')
require('keymaps')
require('theme')
require('precognition').setup()
require('smear_cursor').setup()
