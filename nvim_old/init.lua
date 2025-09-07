-- Bootstrap plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader to " "
vim.g.mapleader = " "

require("lazy").setup("plugins")
require("options")
require("keymaps")
require("plugins")
-- require("snips")

-- Basic keymaps
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
-- Set "j-h" to exit
vim.api.nvim_set_keymap('i', 'jh', '<Esc>', { noremap = true, silent = true })
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Number of spaces a <Tab> counts for
vim.opt.tabstop = 4

-- Number of spaces used for each indentation level
vim.opt.shiftwidth = 4

-- Number of spaces inserted for <Tab> in insert mode
vim.opt.softtabstop = 4

-- Optional: auto-indent based on filetype
vim.cmd([[filetype plugin indent on]])

require("lsp")

require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "c", "haskell", "lua" },
  highlight = { enable = true },
}

-- Open terminal at bottom of the screen
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "haskell" },
  callback = function()
    -- Only add a terminal if one isn't already open
    local terminal_open = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
        terminal_open = true
        break
      end
    end

    if not terminal_open then
      -- Open terminal in bottom quarter and switch back to code
      vim.cmd("belowright split | resize 10 | terminal")
      vim.cmd("wincmd k")  -- Return focus to code
    end
  end,
})

-- Open terminal hotkey
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("belowright split | resize 10 | terminal")
end, { desc = "Open terminal at bottom" })

-- Open ghci
vim.keymap.set("n", "<leader>gh", function()
  vim.cmd("belowright split | resize 10 | terminal ghci")
end, { desc = "Open GHCi in terminal" })

-- Normal Mode hotkey (terminal )
vim.keymap.set('t', 'jh', [[<C-\><C-n>]], { noremap = true })

-- Show Errors / Diagnostics
vim.keymap.set("n", "K", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end, { noremap = true, silent = true })

-- Telescope keybindings
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Grep Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help Tags" })

vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = "LSP Definitions" })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "LSP References" })


-- Telescope Hoogle
require("telescope").load_extension("hoogle")

vim.keymap.set("n", "<leader>hh", function()
  require("telescope").extensions.hoogle.hoogle()
end, { desc = "Hoogle Search" })

-- === Run current Python script in bottom terminal on <C-CR> ===
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


