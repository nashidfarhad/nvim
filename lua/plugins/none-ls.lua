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

		-- fix for ruff formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1286k
		local methods, helpers = require("null-ls.methods"), require("null-ls.helpers")
		local function ruff_fix()
			return helpers.make_builtin({
				name = "ruff",
				meta = {
					url = "https://github.com/charliermarsh/ruff/",
					description = "An extremely fast Python linter, written in Rust.",
				},
				method = methods.internal.FORMATTING,
				filetypes = { "python" },
				generator_opts = {
					command = "ruff",
					args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
					to_stdin = true,
				},
				factory = helpers.formatter_factory,
			})
		end

		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				-- require("none-ls.diagnostics.eslint_d"),
				formatting.stylua, -- this needs ":MasonInstall stylua"
				-- null_ls.builtins.formatting.ruff,
				formatting.prettierd,
				-- formatting.ruff,
        ruff_fix(),
				formatting.isort,
				--null_ls.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- shortcut for formatting
	end,
}
