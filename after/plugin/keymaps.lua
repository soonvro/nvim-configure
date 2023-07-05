--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
vim.keymap.set({'n', 'v'}, '<C-j>',   '10j',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-k>',   '10k',          { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-h>',   ':bp<CR>',      { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-l>',   ':bn<CR>',      { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Up>',    '<C-w>k',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Down>',  '<C-w>j',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Left>',  '<C-w>h',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<Right>', '<C-w>l',       { noremap = true, silent = true })

vim.keymap.set('', '<C-f>', '<Esc>',         { noremap = true, silent = true })
vim.keymap.set('!', '<C-f>', '<Esc>',         { noremap = true, silent = true })
-- vim.keymap.set({'!', 't'}, '<C-f>', '<Esc>',         { noremap = true, silent = true })
-- vim.keymap.set({'i', 'c', 'n', 'v', 'l', 'o', 't'}, '<C-f>', '<Esc>',         { noremap = true, silent = true })
