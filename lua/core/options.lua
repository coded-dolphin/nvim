vim.cmd([[autocmd FileType * set formatoptions-=ro]])

local set = vim.opt --ease of use

-- Enable mouse
set.mouse = "a"

--line numbers
set.number = true
set.relativenumber = true

-- tabbing and indenting
set.tabstop = 4
set.shiftwidth = 4
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

set.hlsearch = false
set.incsearch = true

-- Save undo history
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.vim/undodir"

set.cmdheight = 1
set.laststatus = 0

set.modifiable = true
