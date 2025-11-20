return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"css",
					"lua",
					"html",
					"rust",
					"python",
					"markdown",
					"typescript",
					"javascript",
					"tsx",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.settings.neotree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
		},
		config = function()
			require("plugins.settings.telescope")
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		enabled = false,
		priority = 49,
	},
}
