---@type ChadrcConfig
local M = {}

M.ui = {
    theme = 'nord_hi',
    theme_toggle = { 'nord_hi', 'nord_hi_light',},
    statusline = {
        separator_style = "arrow",
    }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
