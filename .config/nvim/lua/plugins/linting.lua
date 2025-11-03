return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    -- Tell nvim-lint to use 'flake8' for python files
    lint.linters_by_ft = {
      python = { "flake8" },
    }

    -- Configure linting to run automatically
    -- This will run on save and when you enter a buffer
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("nvim-lint-auto", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
