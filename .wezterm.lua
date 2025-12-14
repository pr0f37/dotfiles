-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action
-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.hide_tab_bar_if_only_one_tab = true

-- Left Option sends Escape(Meta), Right Option sends Alt
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.window_decorations = "RESIZE"

config.keys = {
	{ key = "Backspace", mods = "CMD", action = act.SendKey({ key = "u", mods = "CTRL" }) },
	{ key = "LeftArrow", mods = "CMD", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "RightArrow", mods = "CMD", action = act.SendKey({ key = "e", mods = "CTRL" }) },
	{ key = "LeftArrow", mods = "OPT", action = act.SendKey({ key = "b", mods = "ALT" }) },
	{ key = "RightArrow", mods = "OPT", action = act.SendKey({ key = "f", mods = "ALT" }) },

	-- Weztemr specific window and tab management shortcuts
	-- { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	-- { key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
	-- { key = "[", mods = "CMD", action = act.ActivateTabRelative(-1) },
	-- { key = "]", mods = "CMD", action = act.ActivateTabRelative(1) },
	--
	-- { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

return config
