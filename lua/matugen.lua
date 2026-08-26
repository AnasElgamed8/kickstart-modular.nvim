 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101417',
    base01 = '#1c2024',
    base02 = '#262a2e',
    base03 = '#89929a',
    base04 = '#bfc7d0',
    base05 = '#e0e3e7',
    base06 = '#e0e3e7',
    base07 = '#e0e3e7',
    base08 = '#ffb4ab',
    base09 = '#ebb2ff',
    base0A = '#abcae3',
    base0B = '#89ceff',
    base0C = '#ebb2ff',
    base0D = '#89ceff',
    base0E = '#abcae3',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e3e7',          bg = '#101417' })
  hi('TelescopeBorder',         { fg = '#89929a',             bg = '#101417' })
  hi('TelescopePromptNormal',   { fg = '#e0e3e7',          bg = '#101417' })
  hi('TelescopePromptBorder',   { fg = '#89929a',             bg = '#101417' })
  hi('TelescopePromptPrefix',   { fg = '#89ceff',             bg = '#101417' })
  hi('TelescopePromptCounter',  { fg = '#bfc7d0',  bg = '#101417' })
  hi('TelescopePromptTitle',    { fg = '#101417',             bg = '#89ceff' })
  hi('TelescopePreviewTitle',   { fg = '#101417',             bg = '#abcae3' })
  hi('TelescopeResultsTitle',   { fg = '#101417',             bg = '#ebb2ff' })
  hi('TelescopeSelection',      { fg = '#e0e3e7',          bg = '#262a2e' })
  hi('TelescopeSelectionCaret', { fg = '#89ceff',             bg = '#262a2e' })
  hi('TelescopeMatching',       { fg = '#89ceff',             bold = true })
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
