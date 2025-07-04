return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness
    local opts = { noremap = true, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

    opts.desc = "Go to declaration"
    keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

    opts.desc = "idk man i copied it from somewhere"
    keymap.set("n", "gl", vim.diagnostic.open_float, opts)

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace   = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig.html.setup({ capabilities = capabilities })

    lspconfig.cssls.setup({ capabilities = capabilities })

    lspconfig.pyright.setup({ capabilities = capabilities })

    lspconfig.clangd.setup({ capabilities = capabilities })

    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,
      filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    })
    lspconfig.eslint.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })

    -- Format on save with improved behavior
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({
                bufnr = args.buf,
                filter = function(c) return c.id == client.id end,
                async = false,
              })
            end,
          })
        end
      end,
    })
  end,
}
