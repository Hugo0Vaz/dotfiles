return {
    'stevearc/conform.nvim',
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = {c = true, cpp = true}
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
            }
        end,
        formatters_by_ft = {
            lua = {'lua-format'},
            python = {'autopep8'},
            php = {'php_cs_fixer'},
            blade = {'blade-formatter'},
            nix = {'nixfmt'},
            javascript = {'prettierd'},
            html = {'html_beautify'},
            yaml = {'yamlfix'}
        }
    },
    config = function()
        -- Formatting keymap
        vim.keymap.set('n', '<leader>bf',
                       '<cmd>lua require("conform").format()<CR>',
                       {noremap = true, silent = true, desc = "[B]uffer [F]ormat"})
    end
}
