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

vim.keymap.set({'n', 'v'}, '<C-j>',   '10j',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-k>',   '10k',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-h>',   ':bp<CR>',      { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-l>',   ':bn<CR>',      { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Up>',    '<C-w>k',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Down>',  '<C-w>j',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Left>',  '<C-w>h',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Right>', '<C-w>l',       { noremap = true, silent = true })

-- function keys
vim.api.nvim_set_keymap('n', '<F8>', ':SymbolsOutline<CR>', { noremap = true, silent = false })

