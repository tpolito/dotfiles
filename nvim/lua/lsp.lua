local cmp = require('cmp')
local lspconfig = require('lspconfig')
local tabnine = require('cmp_tabnine.config')
local luasnip = require('luasnip')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then 
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then 
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else 
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then 
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

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
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- Format on save
    if client.resolved_capabilities.document_formatting then 
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
    
    local ops = { noremap=true, silent=true }

    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ops)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ops)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ops)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ops)
    buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', ops)
end

--local servers = { 'tsserver', 'gdscript', 'nimls' }

local function config(_config) 
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }, _config or {})
end

require("lspconfig").tsserver.setup(config())
require("lspconfig").gdscript.setup(config())
require("lspconfig").nimls.setup(config()
