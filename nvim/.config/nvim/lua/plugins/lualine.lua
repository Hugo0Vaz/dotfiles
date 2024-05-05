return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require '../lualine_themes/evil_lualine'
    -- require('lualine').setup()
  end,
}
