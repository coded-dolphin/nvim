vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--jk exit insert mode
map("i", "jk", "<ESC>")

-- with J or K move the selected lines up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Indenting in visual mode (tab/shift+tab)
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

map("n", "<leader><leader>x", "<cmd>source %<CR>")

-- Split window
map('n', '<leader>sh', ':split<Return>')
map('n', '<leader>sv', ':vsplit<Return>')

-- Move to first symbol on the line
map("n", "H", "^")

-- Move to last symbol of the line
map("n", "L", "$")

map('n', '-', ':Oil --float<CR>', { noremap = true, silent = true, })
map('n', '<leader>e', ':Oil --float<CR>', { noremap = true, silent = true, })


--Buffer Nav
map("n", "<tab>", ":bn<CR>", { silent = true, noremap = true })
map("n", "<S-tab>", ":bp<CR>", { silent = true, noremap = true })
map("n", "<leader>x", ":bd<CR>", opts)

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fr', builtin.oldfiles, {})
map('n', '<leader>fc', function()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end)

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

vim.keymap.set("n", "Q", "<C-W>q")

-- Space + Space to clean search highlight
vim.keymap.set("n", "<Leader>h", ":noh<CR>", { silent = true })

-- Fixes pasting after visual selection.
vim.keymap.set("v", "p", '"_dP')
