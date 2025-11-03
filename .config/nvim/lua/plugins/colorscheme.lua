return {
    {	'yorickpeterse/nvim-grey',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme grey]])
        end,
    },
    {	'andreasvc/vim-256noir',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme 256_noir]])
        end,
    },
    {
        'kdheepak/monochrome.nvim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme monochrome]])
        end,
    },
    {
        'SYK17/candle-grey',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme candle-grey-transparent]])
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        config = function()
            require('github-theme').setup({
                -- ...
            })

            vim.cmd('colorscheme github_dark')
        end,
    },
    {
        'cvigilv/patana.nvim',
        config = function()
            vim.cmd([[colorscheme patana]])
        end,
    },
    {
        'fenetikm/falcon',
        config = function()
            vim.cmd([[colorscheme falcon]])
        end,
    },
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("lackluster")
            vim.cmd.colorscheme("lackluster-hack") -- my favorite
        end,
    },
    {
        'jaredgorski/fogbell.vim',
        config = function()
            vim.cmd([[colorscheme fogbell]])
        end,
    },
    {
        'LuRsT/austere.vim',
        config = function()
            vim.cmd([[colorscheme austere]])
        end,
    },
    {
        'ntk148v/komau.vim',
        config = function()
            vim.cmd([[colorscheme komau]])
        end,
    },
    {
        'syk17/mies.vim',
        config = function()
            vim.cmd([[colorscheme mies]])
        end,
    },
    {
        'syk17/rams.vim',
        config = function()
            vim.cmd([[colorscheme rams]])
        end,
    },
}
