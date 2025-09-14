-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Insert Mode --
-----------------
vim.keymap.set("i", "jh", [[<C-\><C-n>]], opts)     -- Map <esc> to <jh>
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>", opts) -- <ctrl-l> to correct spelling mistake

-----------------
-- Normal Mode --
-----------------

-- Better Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Telescope Mapping
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep Files" })
-- vim.mistake.set("n", "<leader>fb", "<cmd>Telescope ")

-- Tree Mapping 
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>", { desc = "Find Current File in Tree" })

-----------------
-- Visual Mode --
-----------------

-- Allow repeated indentation without reselecting 
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
