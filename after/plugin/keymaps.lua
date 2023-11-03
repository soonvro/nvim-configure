--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
-- esc key remap
vim.keymap.set({'i', 'n', 'v', 'o', 't'}, '<C-f>', '<Esc>',         { noremap = true, silent = true })
-- esc in command mode
-- Note: In command mode mappings to esc run the command for some odd
-- historical vi compatibility reason. We use the alternate method of
-- existing which is Ctrl-C
vim.keymap.set('c', '<C-f>', '<C-c>',         { noremap = true, silent = true })

vim.keymap.set({'n', 'v'}, 'j',   'gj',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, 'k',   'gk',          { noremap = true, silent = true })

vim.keymap.set({'n', 'v'}, 'n',   'nzz',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, 'N',   'Nzz',          { noremap = true, silent = true })

vim.keymap.set({'n', 'v'}, '<C-j>',   '3<C-e>',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-k>',   '3<C-y>',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-h>',   ':bp<CR>',      { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-l>',   ':bn<CR>',      { noremap = true, silent = true })

vim.keymap.set({'n', 'v'}, '<Up>',    '<C-w>+',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Down>',  '<C-w>-',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Right>', '<C-w>>',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Left>',  '<C-w><',       { noremap = true, silent = true })

-- function keys
vim.api.nvim_set_keymap('n', '<F8>', ':SymbolsOutline<CR>', { noremap = true, silent = false })

