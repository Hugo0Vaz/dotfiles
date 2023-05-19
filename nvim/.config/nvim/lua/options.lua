-- aliases
-- vim.o   -- global
-- vim.g   -- global for let options
-- vim.wo  -- window local
-- vim.bo  -- buffer local
-- vim.fn  -- access vim functions
-- vim.cmd -- vim commands

-- global options
vim.o.completeopt = 'menuone,noselect,noselect'
vim.o.inccommand = 'nosplit'
vim.o.swapfile = true
vim.o.dir = '/tmp'
vim.o.smartcase = true
vim.o.laststatus = 2
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.mouse = 'a'
vim.o.showmatch = true
vim.o.expandtab = true
vim.o.ruler = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmode = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.timeout = false
vim.o.timeoutlen = 10
vim.o.undofile = true
vim.o.title = true
vim.o.hidden = true
vim.o.nu = true
vim.o.rnu = true
vim.o.wrap = false

-- global options for let
vim.g.mapleader = ' '

-- grey column highlight
vim.o.colorcolumn = '80'

-- gruvbox config
vim.o.background = 'dark'
vim.cmd([[colorscheme gruvbox]])

-- newline char
-- vim.cmd([[set list listchars=trail:-,eol:¶]])
vim.cmd([[set list listchars=trail:-,eol:⏎]])

