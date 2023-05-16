local mason_config = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require("mason").setup(mason_config)
require("mason-lspconfig").setup()
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").intelephense.setup {}
require("lspconfig").pyright.setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').rust_analyzer.setup { capabilities = capabilities }
require('lspconfig').lua_ls.setup { capabilities = capabilities }
require('lspconfig').bashls.setup { capabilities = capabilities }
require('lspconfig').intelephense.setup { capabilities = capabilities }
