local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

config = {
    snippet = {
    expand = function(args)
       luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip'},
        { name = 'path' },
        { name = 'nvim_lua' }
    }
}

-- setup of cmp
require('cmp').setup(config)

-- setup of lspconfig for cmp
require('lspconfig').pyright.setup{
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

