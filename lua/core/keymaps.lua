local map = vim.keymap

-- leader key
vim.g.mapleader = " "

--general keymaps 
map.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map.set("n", "<Leader>s", ":write<CR>", { silent = true })

-- Move to first symbol on the line
map.set("n", "H", "^")

-- Move to last symbol of the line
map.set("n", "L", "$")

-- Shift + q - Quit
map.set("n", "Q", "<C-W>q")

-- Quick jumping between splits
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")

-- Indenting in visual mode (tab/shift+tab)
map.set("v", "<Tab>", ">gv")
map.set("v", "<S-Tab>", "<gv")

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- doing x will not copy in clip board
map.set("n", "x", '"_x')

-- Increment/decrement
map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')

-- Split window
map.set('n', 'ss', ':split<Return>') -- below
map.set('n', 'sv', ':vsplit<Return>') -- side

--jk exit insert mode
map.set("i", "jk", "<ESC>")

-- Select all
map.set('n', '<C-a>', 'gg<S-v>G')
