vim.pack.add { 'https://github.com/CRAG666/betterTerm.nvim' }
require('betterTerm').setup {
  position = 'vert',
  size = math.floor(vim.o.columns / 2),
  jump_tab_mapping = '<A-$tab>',
}

local betterTerm = require 'betterTerm'

-- Toggle the first terminal (ID defaults to index_base, which is 0)
vim.keymap.set({ 'n', 't' }, '<C-;>', function() betterTerm.open() end, { desc = 'Toggle terminal' })

-- Open a specific terminal
vim.keymap.set({ 'n', 't' }, '<C-/>', function() betterTerm.open(1) end, { desc = 'Toggle terminal 1' })

-- Cycle to the right
vim.keymap.set({ 'n', 't' }, '<C-PageUp>', function() betterTerm.cycle(1) end, { desc = 'Cycle terminals to the right' })

-- Cycle to the left
vim.keymap.set({ 'n', 't' }, '<C-PageDown>', function() betterTerm.cycle(-1) end, { desc = 'Cycle terminals to the left' })

-- Select a terminal to focus
vim.keymap.set('n', '<leader>tt', betterTerm.select, { desc = 'Select terminal' })

-- Rename the current terminal
vim.keymap.set('n', '<leader>tr', betterTerm.rename, { desc = 'Rename terminal' })

-- Toggle the tabs bar
vim.keymap.set('n', '<leader>tb', betterTerm.toggle_tabs, { desc = 'Toggle terminal tabs' })
