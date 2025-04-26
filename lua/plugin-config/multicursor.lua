require('multiple-cursors').setup()

local map = vim.keymap.set
local opts = { noremap = true, silent = true } -- Standard options for cleaner mappings

-- Normal and Visual modes
map({"n", "x"}, "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down", noremap=true })
map({"n", "x"}, "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up", noremap=true })

-- Normal, Insert, and Visual modes
map({"n", "i", "x"}, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up", noremap=true })
map({"n", "i", "x"}, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down", noremap=true })

-- Normal and Insert modes
map({"n", "i"}, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", { desc = "Add or remove cursor", noremap=true })

-- Visual mode only
map({"x"}, "<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", { desc = "Add cursors to visual area lines", noremap=true })

-- Normal and Visual modes
map({"n", "x"}, "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", { desc = "Add cursors to cword", noremap=true })
map({"n", "x"}, "<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", { desc = "Add cursors to cword in previous area", noremap=true })
map({"n", "x"}, "<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", { desc = "Add cursor and jump to next cword", noremap=true })
map({"n", "x"}, "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", { desc = "Jump to next cword", noremap=true })
map({"n", "x"}, "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", { desc = "Lock virtual cursors", noremap=true })
