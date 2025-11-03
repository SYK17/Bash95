--------------------------------
-- Dynamic Neovim Configurations
--------------------------------

----------------------------------
--  Absolute line number in insert
----------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

-- Relative line number in normal
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})


--------------------------------------------
-- Auto set background color via bash script
--------------------------------------------

-- default color scheme or fallback
vim.g.SCHEME = "256_noir"  -- your default theme

-- Load color scheme on startup
vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		pcall(vim.cmd.colorscheme, vim.g.SCHEME)
	end,
})

-- Save color scheme when changed
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function(params)
		vim.g.SCHEME = params.match
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.textwidth = 125
		-- Create a buffer-local mapping for Tab
		-- <cmd>set expandtab<CR> ensures spaces are used
		-- <C-V><Tab> inputs a literal tab character
		vim.keymap.set('i', '<Tab>', '&nbsp;&nbsp;&nbsp;&nbsp;', { buffer = true, silent = true })
	end,
})
