-- local theme16 = require("base46").get_theme_tb "base_16"
local theme30 = require("base46").get_theme_tb "base_30"

local options = {

  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
  -- TODO = { icon = " ", color = "info" },
    -- TODO = { icon = "󰢌 ", color = "todos" },
    TODO = { icon = "󰮱 ", color = "todo" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "FAILED" } },
   PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    -- PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
   NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    -- NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "SUCCESS", "CORRECT" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = false, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    -- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    pattern = [[.*<(KEYWORDS)(:|;|\s+|\.|,|;|$)]], -- same but don't strictly require the : after the keyword
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {
        "TelescopePrompt",
        "TelescopeResults",
        "help",
        "lazy",
        "lspinfo",
        "mason",
        "nvcheatsheet",
        "nvdash",
        "terminal",
        'nerdtree',
        'unite',
        'OverseerForm',
        'OverseerList',
    }, -- list of file types to exclude highlighting TODO fill
    throttle = 200,
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    -- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    error = { theme30.red },
    -- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    warning = { theme30.orange },
    -- info = { "DiagnosticInfo", "#2563EB" },
    -- info = { theme30.blue },
    -- hint = { "DiagnosticHint", "#10B981" },
    hint = { theme30.grey_fg2 },
    -- default = { "Identifier", "#7C3AED" },
    -- test = { "Identifier", "#FF00FF" },
    test = { theme30.green },
    -- todo = { "#ff00ff" }
    todo = { theme30.purple }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },

}

return options
