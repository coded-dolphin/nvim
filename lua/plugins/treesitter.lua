return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "cpp", "html", "css", "python" },
      sync_install = false,
      -- auto_install = true,
      highlight = {
        enable = true,
        use_language = true;
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>", -- set to `false` to disable one of the mappings
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<Backspace>",
        },
      },
    }
  end
}
