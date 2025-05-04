-- toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*", -- Use latest version
  config = function()
    -- Configure toggleterm
    require("toggleterm").setup({
      size = 20, -- Default terminal size
      open_mapping = [[<c-\>]], -- Key mapping to open the terminal (Ctrl+\)
      hide_numbers = true, -- Hide line numbers in terminal
      shade_filetypes = {}, -- List of filetypes to shade the terminal window
      shading_factor = 2, -- Adjust shading for the terminal
      start_in_insert = true, -- Start in insert mode by default
      insert_mappings = true, -- Enable mappings in insert mode for terminal
      persist_size = true, -- Persist terminal size
      direction = "horizontal", -- Default terminal direction
    })
  end,
}
