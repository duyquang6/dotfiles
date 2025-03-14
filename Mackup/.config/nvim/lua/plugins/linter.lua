return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        yaml = { "yamllint" },
        markdown = { "vale" },
        lua = { "selene" },
        fish = { "fish" },
        sql = { "sqlfluff" },
      },
    },
  },
}
