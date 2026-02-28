return {
  -- Color Scheme
  { "Mofiqul/vscode.nvim", config = function()
      vim.cmd("colorscheme vscode")
    end
  },
  -- Treesitter 
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", 
    config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua", "vim", "markdown", "query", "haskell" },
      highlight = { enable = true },
      indent = { enable = true },
      fold = { enable = true },
    })
  end,},
  -- File Explorer Sidebar 
  { "kyazdani42/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
          -- your custom setup here
          view = {
            width = 30,
            side = "left",
          },
          update_focused_file = {
            enable = true,
          },
        })
      end,
  },
   -- Telescope fuzzy finder
  {
      "nvim-telescope/telescope.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim",   -- required library
          -- Add Fuzzy-finder for faster loading
          "nvim-telescope/telescope-fzf-native.nvim", 
          -- Add tabs-nvim for searching tabs
          "https://github.com/LukasPietzschmann/telescope-tabs.git",
          -- "tsakirist/telescope-tabs.nvim",
      },
      config = function()
          require("telescope").setup{
              defaults = {
                  -- your defaults here, e.g.,
                  file_ignore_patterns = { "node_modules", ".git" },
              }
          }

          -- Load fzf and tabs
          pcall(require("telescope").load_extension, "fzf")
          pcall(require("telescope").load_extension, "tabs")
      end,
  },
}
