local set = vim.opt --ease of use

-- Enable mouse
set.mouse = "a"

--line numbers
set.number = true
set.relativenumber = true

-- tabbing and indenting
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.ai = true
set.si = true

--line warpping
set.wrap = false

-- auto complete
set.completeopt = "noinsert,menuone,noselect"

-- search settings
set.ignorecase = true
set.smartcase = true

-- cursorline
set.cursorline = true
set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 5
set.background = 'dark'

-- appearance
set.termguicolors = true
set.signcolumn = "yes"

-- splits
set.splitright = true
set.splitbelow = true

-- scrolloff
set.scrolloff = 10

-- clipboard
set.clipboard = "unnamedplus"

-- hidden
set.hidden = true

-- swapfile
set.swapfile = false

set.wildmenu = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
