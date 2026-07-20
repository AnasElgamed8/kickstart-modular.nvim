 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#fff8f7',
    base01 = '#ffe8ec',
    base02 = '#ffe1e6',
    base03 = '#8e6f75',
    base04 = '#5a3f45',
    base05 = '#27171b',
    base06 = '#27171b',
    base07 = '#27171b',
    base08 = '#ba1a1a',
    base09 = '#a73400',
    base0A = '#a5355a',
    base0B = '#b60056',
    base0C = '#ffb59d',
    base0D = '#ffb1c3',
    base0E = '#ffb1c3',
    base0F = '#ffdad6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#27171b',          bg = '#fff8f7' })
  hi('TelescopeBorder',         { fg = '#8e6f75',             bg = '#fff8f7' })
  hi('TelescopePromptNormal',   { fg = '#27171b',          bg = '#fff8f7' })
  hi('TelescopePromptBorder',   { fg = '#8e6f75',             bg = '#fff8f7' })
  hi('TelescopePromptPrefix',   { fg = '#b60056',             bg = '#fff8f7' })
  hi('TelescopePromptCounter',  { fg = '#5a3f45',  bg = '#fff8f7' })
  hi('TelescopePromptTitle',    { fg = '#fff8f7',             bg = '#b60056' })
  hi('TelescopePreviewTitle',   { fg = '#fff8f7',             bg = '#a5355a' })
  hi('TelescopeResultsTitle',   { fg = '#fff8f7',             bg = '#a73400' })
  hi('TelescopeSelection',      { fg = '#27171b',          bg = '#ffe1e6' })
  hi('TelescopeSelectionCaret', { fg = '#b60056',             bg = '#ffe1e6' })
  hi('TelescopeMatching',       { fg = '#b60056',             bold = true })
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
