-- https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/folding.lua
return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
  init = function()

		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
  end,
	config = function()
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.foldingRange = {
		-- 	dynamicRegistration = false,
		-- 	lineFoldingOnly = true,
		-- }

		require("ufo").setup()

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "<leader>zo", require("ufo").openAllFolds)
		vim.keymap.set("n", "<leader>zc", require("ufo").closeAllFolds)
	end,
}
