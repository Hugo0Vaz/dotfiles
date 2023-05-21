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
require "packages"

-- global configs
require "options"

-- maps and remaps
require "remaps"

-- plugins config
require "plugins"

-- lsp | mason config
require "lsp-config"
