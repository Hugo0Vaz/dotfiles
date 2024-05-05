local lualine = require 'lualine'

-- Section A:
-- - mode (vim mode)

-- Section B:
-- - filename

-- Section C:
-- - branch (git branch)
-- - diff (git diff status)

-- Section X:
-- - diagnostics (diagnostics count from your preferred source)
-- - LSP Info

-- Section Y:
-- - encoding (file encoding)
-- - fileformat (file format)
-- - filesize
-- - filetype

-- Section Z:
-- - location (location in file in line:column format)

local gruvbox_colors = {
  dark0_hard = '#1d2021',
  dark0 = '#282828',
  dark0_soft = '#32302f',
  dark1 = '#3c3836',
  dark2 = '#504945',
  dark3 = '#665c54',
  dark4 = '#7c6f64',
  gray_245 = '#928374',
  gray_244 = '#928374',
  light0_hard = '#f9f5d7',
  light0 = '#fbf1c7',
  light0_soft = '#f2e5bc',
  light1 = '#ebdbb2',
  light2 = '#d5c4a1',
  light3 = '#bdae93',
  light4 = '#a89984',
  bright_red = '#fb4934',
  bright_green = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue = '#83a598',
  bright_purple = '#d3869b',
  bright_aqua = '#8ec07c',
  bright_orange = '#fe8019',
  neutral_red = '#cc241d',
  neutral_green = '#98971a',
  neutral_yellow = '#d79921',
  neutral_blue = '#458588',
  neutral_purple = '#b16286',
  neutral_aqua = '#689d6a',
  neutral_orange = '#d65d0e',
  faded_red = '#9d0006',
  faded_green = '#79740e',
  faded_yellow = '#b57614',
  faded_blue = '#076678',
  faded_purple = '#8f3f71',
  faded_aqua = '#427b58',
  faded_orange = '#af3a03',
}

local colors = {
  bg = '',
  red = '',
  green = '',
  yellow = '',
  blue = '',
  purple = '',
  aqua = '',
  gray = '',
  fg = '',
  orange = '',
}

local mode_colors = {
  n = colors.red, -- normal
  i = colors.green, -- insert
  v = colors.blue, -- visual by char
  [''] = colors.blue, -- visual blockwise
  V = colors.blue, -- visual by line
  c = colors.magenta, -- command-line editing
  no = colors.red, -- operator-pending
  s = colors.orange, -- select by character
  S = colors.orange, -- select by line
  [''] = colors.orange, -- select blockwise
  ic = colors.yellow, -- insert mode completion
  R = colors.violet, -- replace
  Rv = colors.violet, -- virtual replace
  cv = colors.red, -- vim ex mode
  ce = colors.red, -- normal ex mode
  r = colors.cyan, -- hit-enter prompt
  rm = colors.cyan, -- the -- more -- prompt
  ['r?'] = colors.cyan, -- A |:confirm| query of some sort
  ['!'] = colors.red, -- shell or external command is executing
  t = colors.red, -- terminal mode: keys go to the job
}

local ugoline_theme = {
  normal = {
    a = {
      fg = colors.fg,
      bg = colors.bg,
    },
    b = {
      fg = colors.fg,
      bg = colors.bg,
    },
    c = {
      fg = colors.fg,
      bg = colors.bg,
    },
  },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local function fn_mode_color()
  return function()
    return { fg = mode_colors[vim.fn.mode()] }
  end
end

local config = {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'neo-tree' },
    },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
}

local function ins_comp_sect(section, component)
  if section == 'a' then
    table.insert(config.sections.lualine_a, component)
  elseif section == 'b' then
    table.insert(config.sections.lualine_b, component)
  elseif section == 'c' then
    table.insert(config.sections.lualine_c, component)
  elseif section == 'x' then
    table.insert(config.sections.lualine_x, component)
  elseif section == 'y' then
    table.insert(config.sections.lualine_y, component)
  elseif section == 'z' then
    table.insert(config.sections.lualine_z, component)
  end
end

ins_comp_sect('a', {
  function()
    return ''
  end,
  color = { fg = '#cc241d' },
  padding = { left = 1, right = 2 },
})

lualine.setup(config)
