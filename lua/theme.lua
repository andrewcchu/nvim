vim.opt.wildignore:append({
      "blue.vim",
      "darkblue.vim",
      "delek.vim",
      "desert.vim",
      "elflord.vim",
      "evening.vim",
      "industry.vim",
      "habamax.vim",
      "koehler.vim",
      "lunaperche.vim",
      "morning.vim",
      "murphy.vim",
      "pablo.vim",
      "peachpuff.vim",
      "quiet.vim",
      "ron.vim",
      "shine.vim",
      "slate.vim",
      "sorbet.vim",
      "retrobox.vim",
      "torte.vim",
      "wildcharm.vim",
      "zaibatsu.vim",
      "zellner.vim",
      "unokai.vim",
      "default.vim",
})

-- Bamboo setup
require('bamboo').load()
vim.g.srcery_bg = { 'NONE', 'NONE' } -- Match srcery background with terminal (i.e., transparent)
vim.g.srcery_italic = 1 -- Enable italics

vim.opt.background = "dark" -- set this to dark or light
vim.opt.termguicolors = true
vim.cmd.colorscheme "bamboo"
