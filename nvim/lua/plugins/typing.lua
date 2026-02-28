return {
  {
    -- Allows easy surrounding quotes
    "nvim-mini/mini.surround",
    version = false, -- use latest
    opts = {
        mappings = {
          add = "<leader>sa",        -- Add surrounding in normal & visual mode
          delete = "<leader>sd",     -- Delete surrounding
          find = "<leader>sf",       -- Find surrounding (to the right)
          find_left = "<leader>sF",  -- Find surrounding (to the left)
          highlight = "<leader>sh",  -- Highlight surrounding
          replace = "<leader>sr",    -- Replace surrounding
          update_n_lines = "<leader>sn", -- Update surrounding across lines
        },
    },
  },
  -- Shows keymappings
  {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
          spec = {
              {
              mode = { "n", "v" },  -- normal + visual
              { "s",  group = "+surround" },
              { "sa", desc = "Add surrounding" },
              { "sd", desc = "Delete surrounding" },
              { "sf", desc = "Find right surrounding" },
              { "sF", desc = "Find left surrounding" },
              { "sh", desc = "Highlight surrounding" },
              { "sr", desc = "Replace surrounding" },
              { "sn", desc = "Update surrounding lines" },
             },
          },
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

    -- LaTeX support
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

    -- Auto-Documentation
    {
      "danymat/neogen",
      dependencies = "nvim-treesitter/nvim-treesitter",
      opts = {
          snippet_engine = "luasnip",  
          languages = {
              python = {
                    template = {
                        annotation_convention = "google_docstrings", -- or numpy, or pydoc
                        use_type_annotations = true,
                        use_multiline = true,
                    },
                    placeholders = true,
              }
          }
      },
      keys = {
          { "<leader>dn", "<cmd>Neogen<CR>", desc = "Generate docstring" }
      }
    },
}
