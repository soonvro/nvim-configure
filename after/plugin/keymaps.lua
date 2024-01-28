--------------------------------------------------------------------------------
--                           My Custom Key Mapping                            --
--------------------------------------------------------------------------------
local set_keymap = vim.keymap.set

-- Remap leader and local leader to <Space>.
set_keymap({'n', 'v'}, "<Space>", "<Nop>", { noremap = true, silent = true })

-- For scrolling.
set_keymap({'n', 'v'}, '<C-j>', '3<C-e>', { noremap = true, silent = true })
set_keymap({'n', 'v'}, '<C-k>', '3<C-y>', { noremap = true, silent = true })

-- For moving between buffers.
set_keymap({'n', 'v'}, '<C-h>', ':bp<CR>', { noremap = true, silent = true })
set_keymap({'n', 'v'}, '<C-l>', ':bn<CR>', { noremap = true, silent = true })

-- For graphical cursor movement.
set_keymap({'n', 'v'}, 'j', 'gj', { noremap = true, silent = true })
set_keymap({'n', 'v'}, 'k', 'gk', { noremap = true, silent = true })

-- Move cursor to the center of the screen after jumping.
set_keymap({'n', 'v'}, 'n', 'nzz', { noremap = true, silent = true })
set_keymap({'n', 'v'}, 'N', 'Nzz', { noremap = true, silent = true })

-- For resizing windows.
set_keymap({'n', 'v'}, '<Up>', '<C-w>+', { noremap = true, silent = true })
set_keymap({'n', 'v'}, '<Down>', '<C-w>-', { noremap = true, silent = true })
set_keymap({'n', 'v'}, '<Right>', '<C-w>>', { noremap = true, silent = true })
set_keymap({'n', 'v'}, '<Left>', '<C-w><', { noremap = true, silent = true })

-- function keys
set_keymap({'n'}, '<F8>', ':SymbolsOutline<CR>', { noremap = true, silent = false })

