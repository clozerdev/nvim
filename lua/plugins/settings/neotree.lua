local neotree = require("neo-tree")
neotree.setup({
	window = {
		mappings = {
			["<C-o>"] = "open",
		},
	},
})

local command = require("neo-tree.command")
vim.keymap.set("n", "<leader>nt", function() -- Toggle Neotree
	command.execute({ toggle = true })
end, { desc = "Toggle Neotree" })

vim.keymap.set("n", "<leader>nf", function() -- Focus Neotree
	command.execute({ focus = true })
end, { desc = "Focus Neotree" })
