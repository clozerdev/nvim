-- Enable LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable LSP servers
local lsp_configs = {}
for _, f in pairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
	local server_name = vim.fn.fnamemodify(f, ":t:r")
	table.insert(lsp_configs, server_name)
end

vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.enable(lsp_configs)

-- Completion engine
local cmp = require("cmp")
local utils = require("utils")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-o>"] = cmp.mapping.confirm({ select = true }),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, vim_item)
			local kind = vim_item.kind

			vim_item.kind = (utils.lsp_icons[kind] or "?") .. " "
			vim_item.menu = " [" .. kind .. "]"

			return vim_item
		end,
	},
})

-- Diagnostics
vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	update_in_insert = false,
})

-- LSP Keymaps
local telescope_builtins = require("telescope.builtin")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename item" })
vim.keymap.set("n", "gp", telescope_builtins.diagnostics, { desc = "LSP diagnostics" })
vim.keymap.set("n", "gt", telescope_builtins.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "gd", telescope_builtins.lsp_definitions, { desc = "LSP definitions" })
vim.keymap.set("n", "gi", telescope_builtins.lsp_implementations, { desc = "LSP lsp_implementations" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP code actions" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
