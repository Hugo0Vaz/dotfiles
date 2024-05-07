local lualine = require 'lualine'

local sections = {
  lualine_a = 'a',
  lualine_b = 'b',
  lualine_c = 'c',
  lualine_x = 'x',
  lualine_y = 'y',
  lualine_z = 'z',
}

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
  bg = gruvbox_colors.dark0,
  red = gruvbox_colors.bright_red,
  green = gruvbox_colors.neutral_green,
  yellow = gruvbox_colors.neutral_yellow,
  blue = gruvbox_colors.neutral_blue,
  purple = gruvbox_colors.neutral_purple,
  aqua = gruvbox_colors.neutral_aqua,
  gray = gruvbox_colors.gray,
  fg = gruvbox_colors.light1,
  orange = gruvbox_colors.bright_orange,
}

local mode_colors = {
  n = colors.gray, -- normal
  i = colors.aqua, -- insert
  v = colors.yellow, -- visual by char
  [''] = colors.yellow, -- visual blockwise
  V = colors.yellow, -- visual by line
  c = colors.green, -- command-line editing
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
      fg = gruvbox_colors.light0,
      bg = gruvbox_colors.gray_245,
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
    return mode_colors[vim.fn.mode()]
  end
end

local config = {
  options = {
    icons_enabled = true,
    theme = ugoline_theme,
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
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

local function insert_component_section(section, component)
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

-- insert_component_section(sections.lualine_a, {
--   function()
--     return '▊'
--   end,
-- })

insert_component_section(sections.lualine_a, {
  'mode',
  color = { fg = fn_mode_color(), gui = 'bold' },
})

-- insert_component_section(sections.lualine_a, {
--   function()
--     return '󰢚'
--   end,
-- })

insert_component_section(sections.lualine_b, {
  'filename',
  path = 4,
  padding = {
    left = 3,
    right = 3,
  },
})

insert_component_section(sections.lualine_c, {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
})

insert_component_section(sections.lualine_c, {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
  cond = conditions.hide_in_width,
})

insert_component_section(sections.lualine_x, {
  'branch',
  icon = '',
  color = { fg = colors.purple, gui = 'bold' },
})

insert_component_section(sections.lualine_x, {
  'diff',
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = gruvbox_colors.faded_green },
    modified = { fg = gruvbox_colors.faded_orange },
    removed = { fg = gruvbox_colors.faded_red },
  },
  cond = conditions.hide_in_width,
})

insert_component_section(sections.lualine_z, {
  'filetype',
  colored = false,
  padding = {
    left = 2,
    right = 1,
  },
})

insert_component_section(sections.lualine_z, {
  'fileformat',
  icons_enabled = false,
})

insert_component_section(sections.lualine_z, {
  'encoding',
})

insert_component_section(sections.lualine_z, {
  'location',
})

-- insert_component_section(sections.lualine_z, {
--   function()
--     return '▊'
--   end,
-- })

lualine.setup(config)
