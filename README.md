# Neovim Config

Personal Neovim configuration, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

- Entry point: `init.lua`
- General options: `lua/vimopts.lua`
- Plugin specs: `lua/plugins/*.lua` (auto-loaded by `require("lazy").setup("plugins")`)

**Leader key:** `<Space>`

## Plugins

| Plugin | Purpose |
|---|---|
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Start screen / dashboard shown on launch. |
| [catppuccin/nvim](https://github.com/catppuccin/nvim) | Colorscheme (active theme). |
| [vim-commentary](https://github.com/tpope/vim-commentary) | Comment/uncomment lines with a motion. |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | Autocompletion engine, fed by the LSP. |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet engine and VS Code-style snippet collection, wired into completion. |
| [curl.nvim](https://github.com/oysandvik94/curl.nvim) | Run HTTP requests from `.http`-style buffers inside Neovim. |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Opens [lazygit](https://github.com/jesseduffield/lazygit) in a floating terminal. |
| [mason.nvim](https://github.com/williamboman/mason.nvim) + [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) + [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Installs/manages LSP servers, formatters, and linters (`lua_ls`, `ts_ls`, `ruff`, `prettierd`, `stylua`, `isort`, `eslint_d`). |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Configures and attaches language servers (Lua, TypeScript, Ruff/Python). |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline (dracula theme). |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Renders Markdown files with inline previews as you edit. |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar. |
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) (null-ls) + [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim) | Formatting via `stylua`, `prettierd`, `isort`, and a custom `ruff --fix` formatter. |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | Fuzzy finder for files, live grep, buffers, help tags, and UI picker replacement. Requires `ripgrep` and `fd`. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indentation via Treesitter (`auto_install` enabled). |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) + [promise-async](https://github.com/kevinhwang91/promise-async) | Improved code folding. |
| [undotree](https://github.com/mbbill/undotree) | Visualizes and navigates the undo history tree. |

Two plugin files are currently placeholders with no active config:
- `plugins/debugging.lua` — commented-out `nvim-dap` setup (WIP, not loaded).
- `plugins.lua` — notes on plugins to try later; returns nothing.

## Keyboard Shortcuts

Leader is `<Space>`. Mode column: `n` = normal, `v` = visual, `i` = insert.

### General

| Keys | Mode | Action |
|---|---|---|
| `<leader>tt` | n, v | Toggle LSP diagnostic virtual text on/off |
| `<leader>gf` | n | Format current buffer (LSP formatting via none-ls) |
| `<leader>gu` | n | Toggle Undotree window |
| `<leader>lg` | n | Open LazyGit |

### LSP

| Keys | Mode | Action |
|---|---|---|
| `K` | n | Hover documentation |
| `gd` | n | Go to definition |
| `<leader>ca` | n, v | Code actions |

### Telescope (fuzzy finder)

| Keys | Mode | Action |
|---|---|---|
| `<C-p>` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | List open buffers |
| `<leader>fh` | n | Search help tags |

### File Explorer

| Keys | Mode | Action |
|---|---|---|
| `<C-n>` | n | Reveal current file in Neo-tree (left sidebar) |

### Folding (ufo)

| Keys | Mode | Action |
|---|---|---|
| `<leader>zo` | n | Open all folds |
| `<leader>zc` | n | Close all folds |

### Autocompletion (insert mode, nvim-cmp)

| Keys | Mode | Action |
|---|---|---|
| `<C-Space>` | i | Trigger completion menu |
| `<C-b>` | i | Scroll completion docs up |
| `<C-f>` | i | Scroll completion docs down |
| `<C-e>` | i | Abort completion |
| `<CR>` | i | Confirm selected completion item |
