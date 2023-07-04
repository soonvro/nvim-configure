--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
vim.keymap.set({'n', 'v'},           '<C-j>', '10j',           { noremap = true, silent = true })
vim.keymap.set({'n', 'v'},           '<C-k>', '10k',           { noremap = true, silent = true })
vim.keymap.set({'n', 'v'},           '<C-h>', ':bp<CR>',       { noremap = true, silent = true })
vim.keymap.set({'n', 'v'},           '<C-l>', ':bn<CR>',       { noremap = true, silent = true })
vim.keymap.set({'i', 'c', 'n', 'v', 'l', 'o', 't'}, '<C-f>', '<Esc>',         { noremap = true, silent = true })
