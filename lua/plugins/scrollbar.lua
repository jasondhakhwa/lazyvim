return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      require("scrollbar").setup({
        show = true,
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = true,
          search = true,
        },
      })
      require("scrollbar.handlers.search").setup()
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.diagnostic").setup()
    end,
  },
}
