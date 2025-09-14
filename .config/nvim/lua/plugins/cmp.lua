return {
    "saghen/blink.cmp",
    dependencies = { 
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets" 
    },

    -- Use a release tag to download pre-built binaries
    version = "*", 

    config = function(_, opts)
        -- load vscode-style snippets (friendly-snippets + any custom ones you put in ~/.config/nvim/snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        -- Load custom snippets
        require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })

        -- setup blink
        require("blink.cmp").setup(opts)
    end,

    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = { "snippet_forward", "select_next" },
            ["<S-Tab>"] = { "snippet_backward", "select_prev" },           
        },
        
        fuzzy = { implementation = "prefer_rust_with_warning" },
        snippets = {preset = "luasnip"},
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        completion = {
            -- The keyword should only match against the text before
            keyword = { range = "prefix" },
            menu = {
                -- Use treesitter to highlight the label text for the given list of sources
                draw = { treesitter = { "lsp" } },
            },
            -- Show completions after typing a trigger character, defined by source
            trigger = { show_on_trigger_character = true },
            documentation = { auto_show = true }, -- Show docs automatically
        },
        -- Signature help when typing a trigger character
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}

