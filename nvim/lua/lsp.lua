local lsp_installer = require("nvim-lsp-installer")
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = {};
})

cmp.setup({
    snippet = {
        expand = function(args) 
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
    -- Provides sources for the auto-complete window
        { name = 'nvim_lsp' },
        { name = 'cmp_tabnine' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr) 
    -- Format on save
    if client.resolved_capabilities.document_formatting then 
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

lsp_installer.on_server_ready(function (server)
    local opts = {}
    -- defaults
    opts.capabilities = capabilities
    opts.on_attach = on_attach
    -- This setup function is the same as lspconfig's
    server:setup(opts)
end)
