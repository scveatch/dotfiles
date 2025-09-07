local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Insert mode mappings
map("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>", opts)
map("i", "<C-j>", "<Esc>/\\v\\{[^}]*\\}<CR>ea", opts)
map("i", "<C-k>", "<Esc>/\\$\\$<CR>l<CR>i", opts)
map("i", "jh", "<Esc>", opts)
map("i", "<C-d>", "<C-d>zz", opts)
map("i", "<C-u>", "<C-u>zz", opts)

