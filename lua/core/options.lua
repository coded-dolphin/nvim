vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.g.editorconfig = true

local set = vim.opt

vim.cmd("let g:netrw_banner = 0")

set.number = true
set.relativenumber = true

-- make nvim use the system clipboard
set.clipboard = "unnamedplus"

-- doesnt show the mode you currently are in
set.showmode = false

set.mouse = "" --enables mouse

-- makes it easy to use the visual block mode
set.virtualedit = "block"
set.inccommand = "split"

-- Tabs and spaces
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- indents :/
set.ai = true
set.si = true

-- no wrap >:(
set.wrap = false

-- search and stuffs
set.completeopt = "noinsert,menuone,noselect"
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.inccommand = "split"

-- making it pretty :D
set.cursorline = true
-- set.background = 'dark'
set.termguicolors = true
set.signcolumn = "yes"

set.splitright = true -- split opens to the right
set.splitbelow = true -- splits open below
set.scrolloff = 999   -- the cursor doesnt go below half way

set.hidden = true
set.swapfile = false

-- Extras
set.wildmenu = true
set.hlsearch = true
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.cmdheight = 0
set.modifiable = true
set.backspace = { "start", "eol", "indent" }

set.isfname:append("@-@")
set.updatetime = 50

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    -- Reset to Beam cursor with blinking
    vim.cmd([[set guicursor=a:ver25-blinkon1]])
  end
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
