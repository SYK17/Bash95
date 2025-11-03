return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
                        ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", {})
        vim.keymap.set("n", "<leader>o", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {})
        vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", {})
        vim.keymap.set("n", "<leader>t", "<cmd>Telescope colorscheme<cr>", {})
    end,
}
