return {
  'morhetz/gruvbox',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'gruvbox'
    vim.opt.background = 'dark'
    vim.cmd.hi 'Comment gui=none'
  end,
}
