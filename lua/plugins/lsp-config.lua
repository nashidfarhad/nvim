return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- require("mason").setup()
			local mason, mason_lspconfig, mason_tool_installer =
				require("mason"), require("mason-lspconfig"), require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"ruff", -- python
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd",
					"stylua",
					"isort",
					"ruff", -- black maybe
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ruff", {
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- vim.keymap.set({ "n", "v" }, "<leader>ce", vim.lsp.diagnostic.show_line_diagnostics, {})
		end,
	},
  -- this doesn't work
	-- {
	-- 	"ErichDonGubler/lsp_lines",
	-- 	config = function()
	-- 		require("lsp_lines").setup()

	-- 		vim.keymap.set("", "<Leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
	-- 	end,
	-- },
	-- this is for Nvim 0.10 with 0.11+ changed
	-- https://github.com/neovim/nvim-lspconfig
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- 		local lspconfig = require("lspconfig")
	-- 		lspconfig.lua_ls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		lspconfig.ts_ls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		lspconfig.ruff.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	-- 		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	-- 		-- vim.keymap.set({ "n", "v" }, "<leader>ce", vim.lsp.diagnostic.show_line_diagnostics, {})
	-- 	end,
	-- },
}
