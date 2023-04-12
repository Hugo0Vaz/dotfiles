-- map helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- copy and paste remaps
map('i', '<C-v>',            '<ESC>"+pa')
map('v', '<C-c>',            '"+y')

-- NERDTree remaps
map('n', '<leader>n',        ':NERDTreeFocus<CR>')
map('n', '<C-n>',            ':NERDTreeToggle<CR>')
map('n', '<C-f>',            ':NERDTreeFind<CR>')
map('n', '<leader>bn',       ':bn<CR>')
map('n', '<leader>bd',       ':bd<CR>')

-- clear previous searches, highlights and matches
map('n', '<C-l>',            ':nohl<CR><C-L>')

-- LSP remaps
map('n', 'gD',               '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd',               '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K',                '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi',               '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>',            '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>wa',       '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>wr',       '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>wl',       '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<leader>D',        '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn',       '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca',       '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr',               '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>e',        '<cmd>lua vim.diagnostic.get()<CR>')
map('n', '[d',               '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d',               '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>q',        '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map('n', '<leader>F',        '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- telescope remaps
map('n', '<leader>ff',       '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg',       '<cmd>Telescope live_grep<CR>')
map('n', '<leader>bi',       '<cmd>Telescope buffers<CR>')
map('n', '<leader>fh',       '<cmd>Telescope help_tags<CR>')

-- terminal remap
local tremap = vim.api.nvim_exec([[tnoremap <Esc> <C-\><C-n>]],true)
