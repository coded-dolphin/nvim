-- leader key
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Move to first symbol on the line
vim.keymap.set("n", "H", "^")

-- Move to last symbol of the line
vim.keymap.set("n", "L", "$")

-- Shift + q - Quit
vim.keymap.set("n", "Q", "<C-W>q")

-- Indenting in visual mode (tab/shift+tab)
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Split window
vim.keymap.set('n', 'ss', ':split<Return>') -- below
vim.keymap.set('n', 'sv', ':vsplit<Return>') -- side

--jk exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set("n","<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("v","<leader>x", ":.lua<CR>")
vim.keymap.set("n","<leader>x", ":.lua<CR>")
vim.keymap.set("n","<leader>e", ":Explore<CR>")
