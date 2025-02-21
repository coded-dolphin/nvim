vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
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
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").html.setup { capabilities = capabilities }
      require("lspconfig").cssls.setup { capabilities = capabilities }
      require("lspconfig").pyright.setup { capabilities = capabilities }
      require("lspconfig").clangd.setup { capabilities = capabilities }
      require("lspconfig").emmet_language_server.setup {
        capabilities = capabilities,
        filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      }
      require("lspconfig").eslint.setup { capabilities = capabilities }
      require("lspconfig").ts_ls.setup { capabilities = capabilities }

      -- format on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
      keymap = { preset = 'super-tab' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal'
      },

      signature = { enabled = true }
    },
  },
}
