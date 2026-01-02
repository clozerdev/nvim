return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			opts = {},
		},
		opts = {
			automatic_enable = false,
		},
		config = function()
			require("config.lsp")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}
