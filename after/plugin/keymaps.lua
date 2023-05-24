--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<F9>', ':! norm %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':!cc_run %', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '10j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '10k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
