return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- ✅ Autoformat on save
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },

      -- ✅ Use Prettier for web-related files
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
    },
  },
}
