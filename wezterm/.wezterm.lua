-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Rendering: force the discrete NVIDIA GPU (this box has NVIDIA + AMD iGPU +
-- llvmpipe; WebGpu can otherwise fall back to the iGPU or software rendering).
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Dracula (Official)"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

config.keys = {
    -- Ctrl+Shift++: new pane to the right
    {
      key = "mapped:+",
      mods = "CTRL|SHIFT",
      action = act.SplitPane {
        direction = "Right",
      },
    },
  
    -- Ctrl+Shift+_: new pane below
    {
      key = "mapped:-",
      mods = "CTRL|SHIFT",
      action = act.SplitPane {
        direction = "Down",
      },
    },
  }

-- and finally, return the configuration to wezterm
return config