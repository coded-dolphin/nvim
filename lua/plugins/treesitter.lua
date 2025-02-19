return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "css", "python", "json", "jsonc" },
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },
    }
  end
}
