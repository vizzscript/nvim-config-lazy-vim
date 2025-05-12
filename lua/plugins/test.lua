return {
  {
    "vim-test/vim-test",
    dependencies = { "preservim/vimux" }, -- optional
    config = function()
      vim.cmd([[
        let test#java#runner = 'maventest' " or 'maventest' depending on your setup
      ]])
    end,
  },
}
