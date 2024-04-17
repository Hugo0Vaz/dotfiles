-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "powershell.exe" }

config.color_scheme = "Gruvbox Dark (Gogh)"
return config
