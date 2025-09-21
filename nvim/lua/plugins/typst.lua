return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "typst" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.typ")(fname)
          end,
        },
      },
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      invert_colors = "auto",
      dependencies_bin = {
        ["tinymist"] = vim.fn.stdpath("data") .. "/mason/bin/tinymist",
      },
    },
  },
}
