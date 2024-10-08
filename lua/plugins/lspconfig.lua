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
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                setting = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
        end,
    },
}
