return {
	'folke/zen-mode.nvim',
  dependencies = {
    'folke/twilight.nvim',
  },
  cmd = {'ZenMode', 'Twilight'},
  keys = {
    vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', {silent = true}),
    desc = 'Zenmode',
  },
	config = function()
    require('twilight').setup({
      dimming = { alpha = 0.45, color = { 'Normal', '#ffffff'}, inactive = false},
      context = 9,
      treesitter = true,
      expand = {'function', 'method', 'table', 'if_statement', 'element'},
      exclude = {},
    })
    require("zen-mode").setup({
      wezterm = {
        enabled = true,
      },
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
      },
    })
	end
}
