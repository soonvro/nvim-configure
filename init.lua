--------------------------------------------------------------------------------
--                                      --
--   init.lua                                 --
--                                      --
--   By: soonumor <soonumor@gmail.com>                    --
--                                      --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                              Local Variables                               --
--------------------------------------------------------------------------------
local g     = vim.g
local api   = vim.api
local opt   = vim.opt
local cmd   = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

--------------------------------------------------------------------------------
--                              My nvim settings                              --
--------------------------------------------------------------------------------
-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.number     = true
opt.relativenumber = true
opt.tabstop   = 4 --파일에서 <Tab>이 사용하는 공백 수
opt.softtabstop = 4 --편집하는 동안 <Tab>이 사용하는 공백 수
opt.shiftwidth  = 4 -- (자동)들여쓰기 단계에 사용할 공백 수
opt.expandtab   = true -- 탭 대신 공백 사용-> 파일 type에 따라 따로 설정할 것.
opt.breakindent = true --Enable long line indent
opt.smartindent = true
opt.cindent   = true
opt.ruler     = true -- 현재 커서 위치 표시
opt.showmatch   = true -- 일치하는 괄호 하이라이팅
opt.ignorecase  = true -- 대소문자 구별안함
opt.smartcase   = true -- 대문자 검색 시에만 대소문자 구별
opt.hlsearch  = true -- 검색 시 하이라이팅
opt.inccommand = "split" -- incremental substitution
opt.mouse = "a" -- 모든 마우스 기능 사용
opt.list    = true
opt.listchars = { tab = '▸ ', trail = '·' }
opt.termguicolors = true -- Enable colors in terminal
opt.undofile = true --Save undo history
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.timeoutlen = 700 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.joinspaces = false -- No double spaces with join after a dot
-- opt.scrolloff = 2 -- Lines of context -> This helps mouse wheel up/down

-- show cursor line only in active window and on normal mode
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
autocmd(
  { "InsertLeave", "WinEnter", "BufEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- go to last loc when opening a buffer
autocmd(
   "BufReadPost",
  { pattern = "*",
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- 다음 줄에서 주석 서식 유지되지 않음.
--[[Just using set fo-=cro won't work since many filetypes set/expand formatoption
(like shown above); the FileType autocmd is executed after the filetype files have loaded.]]--
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Always keep the cursor centered.
-- https://stackoverflow.com/questions/13398631/always-keep-the-cursor-centered-in-vim
-- function CentreCursor()
--   local pos = api.nvim_win_get_cursor(0)
--   cmd("normal! zz")
--   api.nvim_win_set_cursor(0, pos)
-- end
-- autocmd(
--   {"CursorMoved", "CursorMovedI"},
--   { pattern = "*", command = "lua CentreCursor()"}
-- )
-- opt.scrolloff = 999 -- Lines of context -> This helps mouse wheel up/down

--------------------------------------------------------------------------------
--                            My Custom Wildignore                            --
--------------------------------------------------------------------------------
vim.o.wildignore = vim.o.wildignore .. '*.o'
vim.o.wildignore = vim.o.wildignore .. '*.out,*.so,*.swp,*.zip'
vim.o.wildignore = vim.o.wildignore .. '*\\tmp\\*,*.swp,*.zip,*.exe'

--------------------------------------------------------------------------------
--                            My Custom initialize                            --
--------------------------------------------------------------------------------
local function isempty(s)
  return s == nil or s == ""
end
local function use_if_defined(val, fallback)
  return val ~= nil and val or fallback
end

-- custom python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog,
                                            conda_prefix .. "/bin/python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog,
                                             conda_prefix .. "/bin/python3")
else
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
end

require("modules/my_scrolloff").setup(2)

--------------------------------------------------------------------------------
--                            lazy.nvim Bootstrap                             --
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

--------------------------------------------------------------------------------
--                               Color Scheme                                 --
--------------------------------------------------------------------------------
vim.cmd("colorscheme everforest")

-- require("null-ls").setup({
  -- sources = {
    -- require("null-ls").builtins.formatting.stylua,
    -- require("null-ls").builtins.diagnostics.eslint,
    -- require("null-ls").builtins.completion.spell,
  -- },
-- })

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
-- 
-- vim.diagnostic.config({
--   float = {
--   border = 'rounded',
--   },
-- })
