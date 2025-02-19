
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

local set = vim.opt --ease of use
set.showmode = false
set.mouse = "a"
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
set.number = true
set.relativenumber = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.ai = true
set.si = true
set.wrap = false
set.completeopt = "noinsert,menuone,noselect"
set.ignorecase = true
set.smartcase = true
set.cursorline = true
set.background = 'dark'
set.termguicolors = true
set.signcolumn = "yes"
set.splitright = true
set.splitbelow = true
set.scrolloff = 999
set.clipboard = "unnamedplus"
set.hidden = true
set.swapfile = false
set.wildmenu = true
set.hlsearch = false
set.incsearch = true
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.cmdheight = 1
set.laststatus = 0
set.modifiable = true
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

