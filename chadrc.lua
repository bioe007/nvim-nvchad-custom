---@type ChadrcConfig
local M = {}

M.ui = {
    theme = 'onenord',
    theme_toggle = { 'onenord', 'onenord_light',},
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
