  -- Treesitter 
 -- return {
 -- "romus204/tree-sitter-manager.nvim",
 --  dependencies = {}, -- tree-sitter CLI must be installed system-wide
 --  config = function()
 --    require("tree-sitter-manager").setup({
 --             ensure_installed = {
 --                "lua", 
 --                "python", 
 --                "c", 
 --                "cpp",
 --                "markdown", 
 --                "haskell", 
 --                "latex", 
 --                "vim", 
 --                "query", 
 --            }, 
 --            auto_install = true,
 --            highlight = true, 

 --      -- Default Options
 --      -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
 --      -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
 --      -- auto_install = false, -- if enabled, install missing parsers when editing a new file
 --      -- highlight = true, -- treesitter highlighting is enabled by default
 --      -- languages = {}, -- override or add new parser sources
 --      -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
 --      -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
 --    })
 --  end
 -- } 
  return {
     "nvim-treesitter/nvim-treesitter", 
     branch = "main",
     build = ":TSUpdate", 
     lazy = false, 
     priority = 1000,
     	--  init = function()
     	-- -- force early runtimepath stabilization
     	-- vim.cmd("packadd nvim-treesitter")
     	--  end,
     config = function()
         print("TREESITTER CONFIG LOADED")
         require("nvim-treesitter.config").setup({
             ensure_installed = {
                 "lua", 
                 "python", 
                 "c", 
                 "cpp",
                 "markdown", 
                 "haskell", 
                 "latex", 
                 "vim", 
                 "query", 
                 "rust",
             }, 
             auto_install = true,
             highlight = {enable = true},
             indent = {enable = false},
         })
          vim.api.nvim_create_autocmd("FileType", {
             pattern = {
                 "python",
                 "haskell",
                 "lua",
                 "rust",
                 "c",
                 "cpp",
             },

             callback = function()
                 pcall(vim.treesitter.start)
        end,
      })
     end,
   }
