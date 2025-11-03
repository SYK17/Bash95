-- <space> as leader key.
-- Must be set before plugins are required
-- otherwise wrong leader might be set.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- Load core settings
require('usr.options')
require('usr.remaps')
require('usr.autocmds')

-- Boostrap and setup lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy to load plugin specifications from the lua/plugins directory
require('lazy').setup('plugins')

-- vim.cmd.colorscheme("quiet")
