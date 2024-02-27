return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
    })
  end,
  keys = {
    {
      "<leader>tv",
      function ()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 35, vim.loop.cwd(), "vertical")
      end,
      desc = "ToggleTerm (vertical)",
    },
    {
      "<leader>th",
      function ()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 12, vim.loop.cwd(), "horizontal")
      end,
      desc = "ToggleTerm (horizontal)",
    },
    {
      mode = "t",
      "<Esc>", [[<C-\><c-n>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "jk", [[<C-\><C-n>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "<C-h>", [[<Cmd>wincmd h<CR>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "<C-j>", [[<Cmd>wincmd j<CR>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "<C-k>", [[<Cmd>wincmd k<CR>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "<C-l>", [[<Cmd>wincmd l<CR>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    },
    {
      mode = "t",
      "<C-w>", [[<C-\><C-n><C-w>]],
      remap = false,
      desc = "Algo de ToggleTerm",
    }
  },
}
