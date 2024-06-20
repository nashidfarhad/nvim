return   -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  {"nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function ()
      local config = require("nvim-treesitter.configs")
      config.setup({
        -- ensure_installed = {"lua", "fennel", "javascript", "python", "yaml", "typescript", "tsx", "json"},
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
