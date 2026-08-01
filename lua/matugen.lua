 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101419',
    base01 = '#1c2025',
    base02 = '#262a30',
    base03 = '#8a919d',
    base04 = '#c0c7d3',
    base05 = '#e0e2ea',
    base06 = '#e0e2ea',
    base07 = '#e0e2ea',
    base08 = '#ffb4ab',
    base09 = '#edb1ff',
    base0A = '#abc9ee',
    base0B = '#9dcaff',
    base0C = '#edb1ff',
    base0D = '#9dcaff',
    base0E = '#abc9ee',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e2ea',          bg = '#101419' })
  hi('TelescopeBorder',         { fg = '#8a919d',             bg = '#101419' })
  hi('TelescopePromptNormal',   { fg = '#e0e2ea',          bg = '#101419' })
  hi('TelescopePromptBorder',   { fg = '#8a919d',             bg = '#101419' })
  hi('TelescopePromptPrefix',   { fg = '#9dcaff',             bg = '#101419' })
  hi('TelescopePromptCounter',  { fg = '#c0c7d3',  bg = '#101419' })
  hi('TelescopePromptTitle',    { fg = '#101419',             bg = '#9dcaff' })
  hi('TelescopePreviewTitle',   { fg = '#101419',             bg = '#abc9ee' })
  hi('TelescopeResultsTitle',   { fg = '#101419',             bg = '#edb1ff' })
  hi('TelescopeSelection',      { fg = '#e0e2ea',          bg = '#262a30' })
  hi('TelescopeSelectionCaret', { fg = '#9dcaff',             bg = '#262a30' })
  hi('TelescopeMatching',       { fg = '#9dcaff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
