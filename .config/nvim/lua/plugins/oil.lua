return {
    'stevearc/oil.nvim',
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        local oil = require('oil')

        oil.setup({
            columns = {
                {
                    'type',
                    icons = {
                        directory = 'd',
                        fifo = 'p',
                        file = '-',
                        link = 'l',
                        socket = 's',
                    },
                },
                { 'permissions' },
                { 'size', highlight = 'Special' },
                { 'mtime', highlight = 'Number' },
                {
                    'icon',
                    default_file = "",  -- You can set your own icon here
                    directory = "",     -- You can set your own icon here
                    add_padding = false,
                },
            },
            win_options = {
                number = false,
                relativenumber = false,
                signcolumn = "no",
                foldcolumn = "0",
                statuscolumn = "",
            },
            cleanup_delay_ms = false,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = true,
            use_default_keymaps = false,
            view_options = {
                is_always_hidden = function(name)
                    return name == ".."
                end,
            },
            -- Custom keymaps
            keymaps = {
                ['g?'] = 'actions.show_help',
                ['K'] = 'actions.preview',  -- Preview functionality
                ['<C-k>'] = 'actions.preview',
                ['-'] = 'actions.parent',
                ['='] = 'actions.select',
                ['+'] = 'actions.select',
                ['<CR>'] = 'actions.select',
                ['<C-h>'] = 'actions.toggle_hidden',
                ['gh'] = 'actions.toggle_hidden',
                ['gs'] = 'actions.change_sort',
                ['gx'] = 'actions.open_external',
                ['gY'] = 'actions.copy_entry_filename',
            },
            -- UI settings
            float = {
                border = "single", -- or "solid" if you prefer
                win_options = {
                    winblend = 0,
                },
            },
            preview = {
                border = "single", -- or "solid" if you prefer
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                border = "single", -- or "solid" if you prefer
                win_options = {
                    winblend = 0,
                },
            },
        })

        -- Set up highlights
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "OilDir", { link = "Directory" })
                vim.api.nvim_set_hl(0, "OilDirIcon", { link = "Directory" })
                vim.api.nvim_set_hl(0, "OilLink", { link = "Constant" })
                vim.api.nvim_set_hl(0, "OilLinkTarget", { link = "Comment" })
                vim.api.nvim_set_hl(0, "OilCopy", { link = "DiagnosticSignHint", bold = true })
                vim.api.nvim_set_hl(0, "OilMove", { link = "DiagnosticSignWarn", bold = true })
                vim.api.nvim_set_hl(0, "OilChange", { link = "DiagnosticSignWarn", bold = true })
                vim.api.nvim_set_hl(0, "OilCreate", { link = "DiagnosticSignInfo", bold = true })
                vim.api.nvim_set_hl(0, "OilDelete", { link = "DiagnosticSignError", bold = true })
            end,
        })
    end,
}
