vim.api.nvim_exec([[
    autocmd FileType * silent! call AutoPairsEnable()
]], false) 
