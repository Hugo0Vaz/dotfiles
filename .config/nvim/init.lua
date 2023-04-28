--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--
--      My Neovim init.lua configuration file
--      Meu arquivo init.lua de configuração do Neovim
--
-- author: Hugo Martins Vaz Silva
-- e-mail: hugomartinsvaz@gmail.com
-- github: Hugo0Vaz

-- packer config
require "plugins"

-- global configs
require "options"

-- maps and remaps
require "remaps"

-- pyright LSP config
require "pyright-config-ls"

-- bashls LSP config
require "bashls-config-ls"

-- hls LSP config
require "hls-config-ls"

-- nvim-cmp config
require "cmp-config"

-- lualine config
require "lualine-config"

-- nvim-autopairs config
require "autopairs-config"

-- luasnip vs code snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- tabset.nvim configuration for tab widths
require "tabset-config"
