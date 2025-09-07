vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
return {
  -- LSP + Completion
  { "neovim/nvim-lspconfig" },
   {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "SirVer/ultisnips",
    },
    config = function()
      require("cmp_nvim_ultisnips").setup({})

      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s" }
          ),
          ["<S-Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s" }
          ),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = {
          { name = "ultisnips" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
  -- Comments
  { "numToStr/Comment.nvim", config = true },
   -- Color Scheme
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.cmd("colorscheme vscode")
    end,
  },
  -- Automatically complete (), {}, ...
  {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup()
  end,
  },
  -- Tab out of parenthesis / brackets, etc.
  -- {
  -- "abecodes/tabout.nvim",
  -- event = "InsertEnter",
  -- dependencies = { "nvim-treesitter", "nvim-cmp" },
  -- config = function()
  --   require("tabout").setup({
  --     tabkey = "<Tab>",        -- key to trigger tabout
  --     backwards_tabkey = "<S-Tab>", -- key to go backwards
  --     act_as_tab = true,       -- if Tab doesn't trigger tabout, insert a tab
  --     completion = true,
  --     ignore_beginning = true,
  --     exclude = {},            -- filetypes to exclude
  --   })
  -- end,
  -- }, 
  -- Telescope Fuzzy Finder 
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "luc-tielen/telescope_hoogle",
      config = function()
        require("telescope").load_extension("hoogle")
      end
    }
  },
  config = function()
    require("telescope").setup({})
  end,
},
  -- LSP servers via mason, loaded eagerly
  { "williamboman/mason.nvim", build = ":MasonUpdate", lazy = false },
  { "williamboman/mason-lspconfig.nvim", lazy = false },

  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Latex
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
