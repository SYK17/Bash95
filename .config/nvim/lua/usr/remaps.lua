----------------------------
-- General Neovim key remaps
----------------------------

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--------------------
-- General
--------------------

-- keeps cursor centered during half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor centered during search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clear search highlights
vim.keymap.set("n", "<leader>n", ":nohl<CR>")

-- toggle "spell"
vim.keymap.set("n", "<leader>s", ":set invspell<CR>")

-- the greatest remap ever?
vim.keymap.set("v", "<leader>p", '"_dp')

-- move highlighted texts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stays in place when using 'J'
vim.keymap.set("n", "J", "mzJ`z")

-- refactor all words in a file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- better gg/G
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "gg", "gg0")
vim.keymap.set("v", "G", "G$")

-- Function to toggle background between light and dark
local function toggle_background()
	-- Get current background setting
	local current_bg = vim.o.background

	-- Toggle to opposite background
	if current_bg == "light" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end

	-- Reapply colorscheme to ensure proper updating
	-- Using pcall in case SCHEME isn't set
	pcall(vim.cmd.colorscheme, vim.g.SCHEME)
end

-- Create the keymapping
vim.keymap.set('n', '<leader>c', toggle_background, 
{ desc = "Toggle between light/dark background" })

-- .MD file shortcuts
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, 'n', "<leader>c", "i- [ ] ", {
			noremap = true, silent = true 
		})
	end
})

--------------------
-- Plugins
--------------------

-- Trouble
-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Lazy (in conflict with Harpoon <leader>l)
-- vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- Oil
-- Regular oil.nvim
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Floating oil.nvim with leader
vim.keymap.set("n", "-", function()
	require("oil").open_float()
end, { desc = "Open parent directory (float)" })

