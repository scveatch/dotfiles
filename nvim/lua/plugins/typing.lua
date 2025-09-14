return {
  {
    -- Allows easy surrounding quotes
    "nvim-mini/mini.surround",
    version = false, -- use latest
    config = function()
      require("mini.surround").setup({
        -- Optional: customize mappings here
        mappings = {
          add = "sa",        -- Add surrounding in normal & visual mode
          delete = "sd",     -- Delete surrounding
          find = "sf",       -- Find surrounding (to the right)
          find_left = "sF",  -- Find surrounding (to the left)
          highlight = "sh",  -- Highlight surrounding
          replace = "sr",    -- Replace surrounding
          update_n_lines = "sn", -- Update surrounding across lines
        },
      })
    end,
  },
  -- Shows keymappings
  {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    }, 
    -- Autocomplete ( [ ", etc
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("nvim-autopairs").setup()
      end,
    },
    -- Tabout 
    {
      "abecodes/tabout.nvim",
      event = "InsertEnter",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("tabout").setup({
          tabkey = "<Tab>",            -- key to trigger tabout
          backwards_tabkey = "<S-Tab>", -- key to go backwards
          act_as_tab = true,           -- if tab doesn’t trigger tabout, insert a tab
          completion = true,           -- integrate with nvim-cmp
          ignore_beginning = true,     -- don’t tabout if cursor is at beginning of a bracket/quote
          exclude = {},                -- filetypes to exclude
        })
      end,
    },

    {
      "lervag/vimtex",
      ft = { "tex" },
      config = function()
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_method = "latexmk"
        vim.opt.conceallevel = 1
        vim.g.tex_conceal = "abdmg"
      end,
    },

}
