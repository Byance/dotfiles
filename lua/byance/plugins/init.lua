function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			vim.cmd("colorscheme rose-pine")
			ColorMyPencils()
		end
	},
	{
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup {
				icons = false,
			}
		end
	},
	{
		'folke/tokyonight.nvim',
		config = function()
			require("tokyonight").setup({})
		end
	},
  { 'folke/which-key.nvim', opts = {} },
}

