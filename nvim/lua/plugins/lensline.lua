return {
  "oribarilan/lensline.nvim",
  tag = "2.0.0",
  event = "LspAttach",
  config = function()
    require("lensline").setup({
      profiles = {
        {
          name = "default",
          style = {
            prefix = "",
            placement = "inline",
          },
        },
      },
    })
  end,
}
