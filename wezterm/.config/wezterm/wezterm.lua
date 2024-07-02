-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "bash" }

config.color_scheme = "Gruvbox Dark (Gogh)"
return config
