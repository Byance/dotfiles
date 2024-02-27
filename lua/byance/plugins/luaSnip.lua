return {
  "L3MON4D3/LuaSnip",
  build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "benfowler/telescope-luasnip.nvim",
  },
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")
    ls.filetype_extend("typescript", { "tsdoc" })
    ls.filetype_extend("javascript", { "jsdoc" })
    ls.filetype_extend("lua", { "luadoc" })
    ls.filetype_extend("rust", { "rustdoc" })
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      ls.jump(-1)
    end, { silent = true })
  end,
}
