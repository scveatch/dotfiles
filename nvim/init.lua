-- Set leader key
vim.g.mapleader = " "

-- Bootstrap and install Lazy.nvim (if not installed)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("options")
require("keymaps")
require("lsp")

-- Open terminal for .py and .hs files
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

-- Set Global Clipboard to clip.exe
vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe Get-Clipboard",
      ["*"] = "powershell.exe Get-Clipboard",
    },
    cache_enabled = 0,
}

