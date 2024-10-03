return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("tokyonight").setup({
      transparent = true,
			style = "night",
			styles = {
				functions = {}
			},
			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end
		})
		vim.cmd [[colorscheme tokyonight]]
	end
}
