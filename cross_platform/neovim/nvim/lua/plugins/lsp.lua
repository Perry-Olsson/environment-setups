---@diagnostic disable: undefined-global
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lsp_config = require('lspconfig')
lsp_config.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {}
    }
}
lsp_config.tsserver.setup{}
lsp_config.lua_ls.setup{}
lsp_config.pyright.setup{}
lsp_config.clangd.setup {}

vim.keymap.set('n', '<leader><S-e>', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>di', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>do', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>")
vim.keymap.set('n', '<leader><S-q>', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", opts)
    end
})
