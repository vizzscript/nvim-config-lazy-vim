return {
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      require("material").setup({})
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
