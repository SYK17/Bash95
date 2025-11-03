---------------------------------------
-- General Static Neovim configurations
---------------------------------------

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- line wrapping
vim.opt.wrap = false

-- cursor line
vim.opt.cursorline = true
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = '*',
})

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- misc.
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- turn off swap file
vim.opt.swapfile = false
