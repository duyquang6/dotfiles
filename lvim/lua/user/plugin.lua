lvim.plugins = {
  { "ziglang/zig.vim" },
  { "sainnhe/gruvbox-material" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "yanskun/gotests.nvim",
    ft = "go",
    config = function()
      require("gotests").setup()
    end,
  },
}
