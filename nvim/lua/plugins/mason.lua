return {
    -- Mason itself
    { "williamboman/mason.nvim", opts = {} },
    -- Bridges Mason with lspconfig
    { "williamboman/mason-lspconfig.nvim", 
      opts = {
          ensure_installed = { "pyright", "hls" },  -- automatically install; modified to remove "hls"
      },
    },
    -- LSP config (required to attach LSPs)
    { "neovim/nvim-lspconfig" },
}

