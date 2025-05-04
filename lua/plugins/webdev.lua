return {
  -- Add JSX colorizer
  { "maxmellon/vim-jsx-pretty", ft = { "javascript", "typescriptreact" } },

  -- Tailwind CSS color support
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true,
    ft = { "typescriptreact", "javascriptreact" },
  },
}
