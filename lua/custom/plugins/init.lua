-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{'kaarmu/typst.vim', ft="typst", lazy=false},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons'
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {

		}
	}
}
