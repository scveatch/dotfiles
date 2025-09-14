return {
  -- Color Scheme
  { "Mofiqul/vscode.nvim", config = function()
      vim.cmd("colorscheme vscode")
    end
  },
  -- Treesitter 
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
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
}
