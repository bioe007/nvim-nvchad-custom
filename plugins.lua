local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "debugpy",
                -- "jedi",
            },
        },
    },
    {
        "tpope/vim-fugitive",
        -- cmd = { "Git", "Gedit", "Gsplit", "Gdiffsplit" },
        event = "VeryLazy",
        lazy = false,
    },
    {
        "folke/trouble.nvim", lazy= false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        -- TODO what a pita, https://github.com/folke/todo-comments.nvim/issues/181
        "folke/todo-comments.nvim", lazy=false,
        requires = "nvim-lua/plenary.vim",
        init = function() require("core.utils").lazy_load "todo-comments.nvim" end,
        opts = function() return require "custom.configs.todocomments" end,
        config = function(_, opts) require("todo-comments").setup(opts) end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        ft = "go",
        opts = function() return require "custom.configs.null-ls" end,
    },
    {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        ft = "python",
        opts = function() return require "custom.configs.null-ls" end,
    },
    {
        "mfussenegger/nvim-dap",
        init = function() require("core.utils").load_mappings("dap") end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft="go",
        dependencies={
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft="python",
        dependencies={
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_,opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    }
}
return plugins
