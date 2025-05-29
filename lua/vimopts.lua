-- vim options

vim.g.mapleader = " " -- setting leader key to space
vim.wo.number = true -- show line number in file/buffer

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- this is needed to show error messages from LSP servers on screen
-- vim.diagnostic.config({
--   virtual_text = true
-- })

-- this doens't work config is a function
-- vim.diagnostic.config.virtual_text = true

vim.g.virtual_text_visible = false

function _G.toggle_diagnostics()
	if vim.g.virtual_text_visible then
		vim.g.virtual_text_visible = false
		vim.diagnostic.config({
			virtual_text = false,
		})
		print("Virtual texts are hidden")
	else
		vim.g.virtual_text_visible = true
		vim.diagnostic.config({
			virtual_text = true,
		})
		print("Virtual texts are visible")
	end
end

vim.keymap.set({ "n", "v" }, "<leader>tt", toggle_diagnostics, {})
