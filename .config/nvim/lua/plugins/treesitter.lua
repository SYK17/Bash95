return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Automatically run :TSUpdate on install/update
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "python", "c", "cpp", "lua" }, -- Add other languages you use
      highlight = {
        enable = true,
      },
      indent = {
        enable = true, -- This is important for hlchunk's indentation detection
      },
      -- Add other treesitter options as needed
    }
  end,
}
