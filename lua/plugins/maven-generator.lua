return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.defaults["<leader>m"] = {
      name = "+maven",
      g = {
        function()
          local Terminal = require("toggleterm.terminal").Terminal

          -- Ask for groupId
          vim.ui.input({ prompt = "Enter groupId (e.g. com.example): " }, function(groupId)
            if not groupId or groupId == "" then
              return
            end

            -- Ask for artifactId
            vim.ui.input({ prompt = "Enter artifactId (e.g. myapp): " }, function(artifactId)
              if not artifactId or artifactId == "" then
                return
              end

              -- Construct command dynamically
              local mvn_cmd = string.format(
                "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false",
                groupId,
                artifactId
              )

              -- Open terminal with the generated command
              local mvn_term = Terminal:new({
                cmd = mvn_cmd,
                direction = "float",
                close_on_exit = false,
                hidden = true,
              })
              mvn_term:toggle()
            end)
          end)
        end,
        "Generate Maven Project",
      },
    }
  end,
}
