local wezterm = require("wezterm")
local act = wezterm.action

local config = {
	font_size = 13,
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.75,
	macos_window_background_blur = 40,

	text_background_opacity = 0.9,

	adjust_window_size_when_changing_font_size = false,

	initial_cols = 160,
	initial_rows = 45,
	window_padding = {
		left = 20,
		right = 20,
		top = 10,
		bottom = 5,
	},

	disable_default_key_bindings = true,
	keys = {
		{
			key = "d",
			mods = "SUPER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "d",
			mods = "SUPER|SHIFT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "f",
			mods = "SUPER",
			action = act.Search({ CaseInSensitiveString = "" }),
		},
		{
			key = "f",
			mods = "SUPER|SHIFT",
			action = act.Search({ Regex = "" }),
		},
		{
			key = "v",
			mods = "SUPER",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "w",
			mods = "SUPER",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "t",
			mods = "SUPER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "1",
			mods = "SUPER",
			action = act.ActivateTab(0),
		},
		{
			key = "2",
			mods = "SUPER",
			action = act.ActivateTab(1),
		},
		{
			key = "3",
			mods = "SUPER",
			action = act.ActivateTab(2),
		},
		{
			key = "4",
			mods = "SUPER",
			action = act.ActivateTab(3),
		},
		{
			key = "5",
			mods = "SUPER",
			action = act.ActivateTab(4),
		},
		{
			key = "6",
			mods = "SUPER",
			action = act.ActivateTab(5),
		},
		{
			key = "7",
			mods = "SUPER",
			action = act.ActivateTab(6),
		},
		{
			key = "8",
			mods = "SUPER",
			action = act.ActivateTab(7),
		},
		{
			key = "9",
			mods = "SUPER",
			action = act.ActivateTab(-1),
		},
		{
			key = "q",
			mods = "SUPER",
			action = act.QuitApplication,
		},
		{
			key = "UpArrow",
			mods = "SHIFT",
			action = act.ScrollByLine(-5),
		},
		{
			key = "DownArrow",
			mods = "SHIFT",
			action = act.ScrollByLine(5),
		},
		{
			key = "UpArrow",
			mods = "SUPER|SHIFT",
			action = act.ScrollByPage(-0.5),
		},
		{
			key = "DownArrow",
			mods = "SUPER|SHIFT",
			action = act.ScrollByPage(0.5),
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = act({ SendString = "\x1bb" }),
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = act({ SendString = "\x1bf" }),
		},
		{
			key = "-",
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},
		{
			key = "=",
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},
	},
}

wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
	position = "bottom",
	max_width = 32,
	dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
	indicator = {
		leader = {
			enabled = true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = true,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		numerals = "arabic", -- or "roman"
		pane_count = "superscript", -- or "subscript", false
		brackets = {
			active = { "", ":" },
			inactive = { "", ":" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		enabled = true,
		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})

return config
