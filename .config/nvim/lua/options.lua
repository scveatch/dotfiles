-- Basic Config Settings 
vim.opt.clipboard = "unnamedplus" 	-- Use system clipboard
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.mouse = "a"  			-- Allow the mouse 

-- Tabs
vim.opt.tabstop = 4 			-- Number of visual spaces per TAB
vim.opt.softtabstop = 4 		-- Number of spaces in tab when editing
vim.opt.shiftwidth = 4 			-- Insert 4 spaces for a tab 
vim.opt.expandtab = true 		-- Tabs are spaces, mostly for python

-- UI
vim.opt.number = true 			-- Show absolute number
vim.opt.relativenumber = true	-- Add numbers to each line on left side
vim.opt.splitbelow = true       -- open new vertical split bottom
vim.opt.splitright = true       -- New horizontal splits right

-- Searching 
vim.opt.incsearch = true        -- Search as characters are entered
vim.opt.ignorecase = true       -- Ignore case in searches by default 
vim.opt.smartcase = true        -- Case sensitive search if capital is entered
