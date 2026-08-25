 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101415',
    base01 = '#1d2022',
    base02 = '#272a2c',
    base03 = '#899296',
    base04 = '#bfc8cc',
    base05 = '#e0e3e5',
    base06 = '#e0e3e5',
    base07 = '#e0e3e5',
    base08 = '#ffb4ab',
    base09 = '#e3b7f3',
    base0A = '#b0cbd6',
    base0B = '#8ad0eb',
    base0C = '#e3b7f3',
    base0D = '#8ad0eb',
    base0E = '#b0cbd6',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e3e5',          bg = '#101415' })
  hi('TelescopeBorder',         { fg = '#899296',             bg = '#101415' })
  hi('TelescopePromptNormal',   { fg = '#e0e3e5',          bg = '#101415' })
  hi('TelescopePromptBorder',   { fg = '#899296',             bg = '#101415' })
  hi('TelescopePromptPrefix',   { fg = '#8ad0eb',             bg = '#101415' })
  hi('TelescopePromptCounter',  { fg = '#bfc8cc',  bg = '#101415' })
  hi('TelescopePromptTitle',    { fg = '#101415',             bg = '#8ad0eb' })
  hi('TelescopePreviewTitle',   { fg = '#101415',             bg = '#b0cbd6' })
  hi('TelescopeResultsTitle',   { fg = '#101415',             bg = '#e3b7f3' })
  hi('TelescopeSelection',      { fg = '#e0e3e5',          bg = '#272a2c' })
  hi('TelescopeSelectionCaret', { fg = '#8ad0eb',             bg = '#272a2c' })
  hi('TelescopeMatching',       { fg = '#8ad0eb',             bold = true })
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
