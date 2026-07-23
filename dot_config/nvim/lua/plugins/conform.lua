return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      -- Python
      python = { "ruff_format" },

      -- Rust
      rust = { "rustfmt" },

      -- Lua
      lua = { "stylua" },

      -- Haskell
      haskell = { "ormolu" },

      -- Shell
      sh = { "shfmt" },

      -- JSON/YAML/etc.
      json = { "jq" },
      yaml = { "prettier" },

      -- Markdown
      markdown = { "prettier" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
