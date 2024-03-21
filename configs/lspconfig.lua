local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")



lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = lspconfig.util.root_pattern("Cargo.toml")
})


lspconfig.gopls.setup{
    on_attach=on_attach,
    capabilities = capabilities,
    cmd={"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    single_file_support=true,
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unreachable = true,
                unusedparams = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            usePlaceholders = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            }
    },
  },
}

lspconfig.pyright.setup({
    on_attach = on_attach,
    cmd = {"pyright-langserver", "--stdio"},
    capabilities = (function()
        local cap = vim.lsp.protocol.make_client_capabilities()
        cap.textDocument.publishDiagnostics.tagSupport.valueSet = {2}
        return cap
    end)(),
    filetypes = {"python"},
    settings = {
        python = {
            analysis = {
                diagnosticMode = "off",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                },
                typeCheckingMode = "off",
            },
        },
    },
})

-- lspconfig.pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 79
--         }
--       }
--     }
--   }
-- }
