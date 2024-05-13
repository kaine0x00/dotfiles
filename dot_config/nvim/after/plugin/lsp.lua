local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
  'rust_analyzer',
  'clangd',
  'lua_ls',
  'marksman',
  'omnisharp',
  'pylsp',
  'html'
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-M-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-M-j>'] = cmp.mapping.scroll_docs(4),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vi", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vw", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vnd", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>vpd", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrf", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local virtual_text_enabled = true  -- This holds the current state of virtual text

function ToggleVirtualText()
    virtual_text_enabled = not virtual_text_enabled  -- Toggle the state
    local clients = vim.lsp.get_active_clients()
    if #clients < 1 then return end  -- If no LSP clients are active, do nothing

    if virtual_text_enabled then
        -- Enable virtual text
        vim.diagnostic.config({
            virtual_text = true,
        })
    else
        -- Disable virtual text
        vim.diagnostic.config({
            virtual_text = false,
        })
    end
end

vim.api.nvim_set_keymap('n', '<leader>vt', '<cmd>lua ToggleVirtualText()<CR>', {noremap = true, silent = true})

