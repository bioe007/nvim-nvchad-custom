-- TODO:
-- 0. git my custom parts
-- 1. highlight TODO/NOTEs setc
-- 2. learn rest of nvchad highlights
-- 3. clean up the recommender, it's a bit ridiculous
--
local vim = vim
local opt = vim.opt

opt.filetype = "ON"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 50
opt.scrolloff = 8

opt.hlsearch = false
opt.incsearch = true
opt.syntax = "ON"
opt.termguicolors = true
opt.colorcolumn = "80"
opt.tw = 80

opt.sts = 4
opt.ts = 4
opt.sw = 4
opt.smartindent = true
opt.autoindent = true
opt.shiftround = true
opt.smartcase = true
opt.cindent = true
opt.wrap = false
opt.relativenumber = true

-- TODO
opt.shortmess = opt.shortmess + {I=true} + {a=true}

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {   pattern = { "*" },   command = [[%s/\s\+$//e]], })


-- Strip trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})


-- local group_python = vim.api.nvim_create_augroup("PythonGroup", {clear = true})
-- vim.api.nvim_create_autocmd("BufEnter", {}, group = group_python)
