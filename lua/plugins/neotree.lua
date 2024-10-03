return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n','<leader>e', ':Neotree filesystem toggle left <CR>', {noremap = true,silent = true,})

    -- Disable statusline for Neotree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        vim.opt_local.laststatus = 0
      end,
    })

    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "neo-tree",
      callback = function()
        vim.opt_local.laststatus = 2
      end,
    })
  end
}
