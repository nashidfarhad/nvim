return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local mason_null_ls, null_ls, null_ls_utils =
			require("mason-null-ls"), require("null-ls"), require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint_d",
				"ruff",
			},
		})
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				-- require("none-ls.diagnostics.eslint_d"),
				formatting.stylua, -- this needs ":MasonInstall stylua"
				-- null_ls.builtins.formatting.ruff,
				formatting.prettierd,
				formatting.ruff,
				formatting.isort,
				--null_ls.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- shortcut for formatting
	end,
}
