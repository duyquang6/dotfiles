return {
  { import = "lazyvim.plugins.extras.util.project" },

  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
}
