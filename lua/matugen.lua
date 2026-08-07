 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#12140e',
    base01 = '#1e201a',
    base02 = '#292b24',
    base03 = '#8e9382',
    base04 = '#c4c8b6',
    base05 = '#e3e3d8',
    base06 = '#e3e3d8',
    base07 = '#e3e3d8',
    base08 = '#ffb4ab',
    base09 = '#75daad',
    base0A = '#bdcc9f',
    base0B = '#afd274',
    base0C = '#75daad',
    base0D = '#afd274',
    base0E = '#bdcc9f',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e3e3d8',          bg = '#12140e' })
  hi('TelescopeBorder',         { fg = '#8e9382',             bg = '#12140e' })
  hi('TelescopePromptNormal',   { fg = '#e3e3d8',          bg = '#12140e' })
  hi('TelescopePromptBorder',   { fg = '#8e9382',             bg = '#12140e' })
  hi('TelescopePromptPrefix',   { fg = '#afd274',             bg = '#12140e' })
  hi('TelescopePromptCounter',  { fg = '#c4c8b6',  bg = '#12140e' })
  hi('TelescopePromptTitle',    { fg = '#12140e',             bg = '#afd274' })
  hi('TelescopePreviewTitle',   { fg = '#12140e',             bg = '#bdcc9f' })
  hi('TelescopeResultsTitle',   { fg = '#12140e',             bg = '#75daad' })
  hi('TelescopeSelection',      { fg = '#e3e3d8',          bg = '#292b24' })
  hi('TelescopeSelectionCaret', { fg = '#afd274',             bg = '#292b24' })
  hi('TelescopeMatching',       { fg = '#afd274',             bold = true })
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
