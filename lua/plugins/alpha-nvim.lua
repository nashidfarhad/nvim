-- https://github.com/goolord/alpha-nvim
-- beautiful greeting screen
-- https://github.com/goolord/alpha-nvim/discussions/16
-- -- this for more themes
return {
  "goolord/alpha-nvim",
  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}
