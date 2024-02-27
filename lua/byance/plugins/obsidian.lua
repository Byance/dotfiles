return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'hrsh7th/nvim-cmp',
  },
  opts = {
    workspaces = {
      {
        name = "mpl",
        path = "G:\\Mi unidad\\vault\\compiler-book\\mpl\\mpl",
      },
    },
  },
  config = function ()
    require("obsidian").setup({
      dir = "G:/Mi unidad/vault/compiler-book/mpl/mpl",
      workspaces = {
        {
          name = "mpl",
          path = "G:/Mi unidad/vault/compiler-book/mpl/mpl",
        },
        {
          name = "no-vault",
          path = function()
            -- alternatively use the CWD:
            -- return assert(vim.fn.getcwd())
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
            completion = {
              new_notes_location = "current_dir",
            },
            templates = {
              subdir = vim.NIL,
            },
            disable_frontmatter = true,
          },
        },
      },
    })
    vim.opt_local.conceallevel = 2
  end
}