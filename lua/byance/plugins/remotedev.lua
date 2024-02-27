return {
  "jamestthompson3/nvim-remote-containers",
  keys = {
    {
      "<leader>cu",
      function ()
        vim.cmd("ComposeUp")
      end
    },
    {
      "<leader>cd",
      function ()
        vim.cmd("ComposeDown")
      end
    },
  },
}
