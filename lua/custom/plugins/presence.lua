return {
	{
		'andweeb/presence.nvim',
		lazy = false,
		config = function()
			require("presence").setup({
				auto_update = true,
				neovim_image_text = "dont press :q! pls 🥺👉👈",
				main_image = "neovim",
				buttons = true,
				show_time = true,
			})
		end
	}
}
