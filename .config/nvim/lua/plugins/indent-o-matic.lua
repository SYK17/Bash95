return {
  'Darazaki/indent-o-matic',
  lazy = false, -- Or specify an event like 'BufReadPre'
  config = function()
    require('indent-o-matic').setup {
      -- Optional: Configure indent-o-matic here.
      -- These are the default values, you can change them if needed.
      max_lines = 2048,
      standard_widths = { 2, 4, 8 },
      -- skip_comments_and_strings = false,
      -- filetype_lisp = { max_lines = 0 },
    }
  end,
}
