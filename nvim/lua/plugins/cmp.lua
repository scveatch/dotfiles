return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    -- Use a release tag to download pre-built binaries
    version = "*", 

    opts = {
        keymap = {
            preset = "enter",
        },
        
        fuzzy = { implementation = "prefer_rust_with_warning" },

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

