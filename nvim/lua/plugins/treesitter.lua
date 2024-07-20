return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "windwp/nvim-ts-autotag"
  },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "php",
        "json",
        "yaml",
        "html",
        "lua",
        "css",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = { enable = true },
      autotag = { enable = true },
    })
  end,
}

