local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets')
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function() require('dap-python').test_method() end,
      "Debug python test"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>gt"] = {
      function() require('dap-go').test_method() end,
      "run tests",
    },

    ["<leader>dgt"] = {
      function() require('dap-go').debug_test() end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function() require('dap-go').debug_last() end,
      "Debug last go test"
    },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.nvterm = {
    plugin = true,
    n = {
        ["<leader>h"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },
    },
}

M.disabled = {
    n = {
        ["<leader>h"] = "",
        ["<leader>b"] = "",
        ["<leader>n"] = "",  -- default nvchad this turns off line number..
    },
}

M.abc = {
    n = {
        -- exe 'map <Leader>b :buffer '
        ["<leader>b"] = {":Telescope buffers<CR>"},
        ["<C-d>"] = {"<C-d>zz"},
        ["<C-u>"] = {"<C-u>zz"},
        ["n"] = {"nzzzv"},
        ["N"] = {"Nzzzv"},
        -- Toggle Autocompletion for Writingmode, this is handy
        ["<leader>3"] = {
            function()
                vim.b.cmp_enabled = not vim.b.cmp_enabled
                    require('cmp').setup.buffer { enabled = not vim.b.cmp_enabled }
            end,
            "Toggle Autocompletion CMP",     },
    }
}

-- M.general = {
    -- n = {
        -- -- Toggle Autocompletion for Writingmode
        -- ["<C-0>"] = {
            -- function()
                -- vim.b.cmp_enabled = not vim.b.cmp_enabled
                    -- require('cmp').setup.buffer { enabled = not vim.b.cmp_enabled }
            -- end,
            -- "Toggle Autocompletion CMP",     },
    -- }
-- }

return M
