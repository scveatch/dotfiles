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

-- Fold Mapping 
vim.keymap.set("n", "za", "zO", opts, {desc = "Swap za and zO"})
vim.keymap.set("n", "zO", "za", opts, {desc = "Swap zO and za"})

-- Execution Mappings
-- == Run Python File in Terminal == 
vim.keymap.set("n", "<leader>r", function()
  local term_bufnr = nil
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buftype == "terminal" then
      term_bufnr = bufnr
    end
  end

  if term_bufnr == nil then
    print("No terminal buffer found.")
    return
  end

  local filepath = vim.fn.expand("%:p")
  vim.cmd("write")
  vim.fn.chansend(vim.b.terminal_job_id or vim.api.nvim_buf_get_var(term_bufnr, "terminal_job_id"),
    "python " .. filepath .. "\n"
  )
end, { desc = "Run current file in terminal" })

-- == Open Terminal == 
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("belowright split | resize 10 | terminal")
end, { desc = "Open terminal at bottom" })

-----------------
-- Visual Mode --
-----------------

-- Allow repeated indentation without reselecting 
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-------------------
-- Terminal Mode --
-------------------
vim.keymap.set("t", "jh", [[<C-\><C-n>]], opts)  -- Map <esc> to <jh> in terminal

-------------------
--  Debug Mode   --
-------------------
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {desc = "Toggle Breakpoint"})
vim.keymap.set("n", "<leader>dB", function()  
    require("dap").clear_breakpoints()
end, { desc = "Clear all breakpoints" })
vim.keymap.set("n", "<leader>dc", dap.continue, {desc = "Continue / Start debug"})
vim.keymap.set("n", "<leader>di", dap.step_into, {desc = "Step Into"})
vim.keymap.set("n", "<leader>do", dap.step_over, {desc = "Step Over"})
vim.keymap.set("n", "<leader>dO", dap.step_out, {desc = "Step Out"})
vim.keymap.set("n", "<leader>du", dapui.toggle, {desc = "Toggle"})
vim.keymap.set("n", "<leader>dr", dap.repl.open, {desc = "Open repl"})
vim.keymap.set("n", "<leader>dl", dap.run_last, {desc = "Run Last"})


