return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright",
        "lua_ls",
        "html",
        "cssls",
        "clangd",
        "emmet_language_server",
        "eslint",
        "ts_ls",
      },
      automatic_installation = true,
    })
  end,

}
