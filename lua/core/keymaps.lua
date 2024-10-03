local map = vim.keymap

-- leader key
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Move to first symbol on the line
map.set("n", "H", "^")

-- Move to last symbol of the line
map.set("n", "L", "$")

-- Shift + q - Quit
map.set("n", "Q", "<C-W>q")

-- Indenting in visual mode (tab/shift+tab)
map.set("v", "<Tab>", ">gv")
map.set("v", "<S-Tab>", "<gv")

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Split window
map.set('n', 'ss', ':split<Return>') -- below
map.set('n', 'sv', ':vsplit<Return>') -- side

--jk exit insert mode
map.set("i", "jk", "<ESC>")

-- Select all
map.set('n', '<C-a>', 'gg<S-v>G')

--Buffer Nav
map.set("n", "<tab>", ":bn<CR>", {silent = true, noremap = true})
map.set("n", "<S-tab>", ":bp<CR>", {silent = true, noremap = true})
map.set("n", "<leader>x", ":bd<CR>", {silent = true, noremap = true})

map.set("n", "<leader>ft", vim.lsp.buf.format)
map.set("n", "<leader>tr", ":ToggleTerm<CR>", {silent = true, noremap = true})
