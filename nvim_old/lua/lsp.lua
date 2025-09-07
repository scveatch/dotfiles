local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- 1. Setup mason first
mason.setup()

-- 2. Setup mason-lspconfig after mason
mason_lspconfig.setup({
  ensure_installed = { "pyright", "clangd", "hls" },
})

local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- 3. Setup handlers for installed servers
-- local servers = { "pyright", "clangd", "hls" }
-- for _, server in ipairs(servers) do
--   lspconfig[server].setup({
--     capabilities = require("cmp_nvim_lsp").default_capabilities(),
--   })
-- end
-- 4. Setup completion (unchanged)
-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--
--     -- Tab to jump outside of (), [], {}, ...
--     ["<Tab>"] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_next_item()
--     else
--       fallback()
--     end
--   end, { "i", "s" }),
--
--   -- Shift-Tab to navigate backward
--   ["<S-Tab>"] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_prev_item()
--     else
--       fallback()
--     end
--   end, { "i", "s" }),
--   }),
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "path" },
--     { name = 'ultisnips' },
--   }),
-- })
-- local cmp = require("cmp")
-- local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       vim.fn["UltiSnips#Anon"](args.body)
--     end,
--   },
--   mapping = {
--     ["<Tab>"] = function(fallback)
--       if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
--         vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"), "")
--       elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
--         vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpForwards()<CR>"), "")
--       elseif cmp.visible() then
--         cmp.select_next_item()
--       else
--         fallback()
--       end
--     end,
--     ["<S-Tab>"] = function(fallback)
--       if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
--         vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"), "")
--       elseif cmp.visible() then
--         cmp.select_prev_item()
--       else
--         fallback()
--       end
--     end,
--     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--   },
--   sources = {
--     { name = "ultisnips" },
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "path" },
--   },
-- })


local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

