--------------------------------------------------------------------------------
--                                                                            --
--   init.lua                                                                 --
--                                                                            --
--   By: soonumor <soonumor@gmail.com>                                        --
--                                                                            --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                                Dependencies                                --
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--                                 Plugin List                                --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                               Local Variables                              --
--------------------------------------------------------------------------------
local g       = vim.g
local api     = vim.api
local opt     = vim.opt
local cmd     = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

--------------------------------------------------------------------------------
--                              My nvim settings                              --
--------------------------------------------------------------------------------
-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.number         = true
opt.relativenumber = true
opt.tabstop     = 4 --파일에서 <Tab>이 사용하는 공백 수
opt.softtabstop = 4 --편집하는 동안 <Tab>이 사용하는 공백 수
opt.shiftwidth  = 4 -- (자동)들여쓰기 단계에 사용할 공백 수
opt.expandtab   = true -- 탭 대신 공백 사용
opt.breakindent = true --Enable long line indent
opt.smartindent = true
opt.cindent     = true
opt.ruler       = true -- 현재 커서 위치 표시
opt.showmatch   = true -- 일치하는 괄호 하이라이팅
opt.ignorecase  = true -- 대소문자 구별안함
opt.smartcase   = true -- 대문자 검색 시에만 대소문자 구별
opt.hlsearch    = true -- 검색 시 하이라이팅
opt.inccommand = "split" -- incremental substitution
opt.mouse = "a" -- 모든 마우스 기능 사용
opt.list      = true
opt.listchars = { tab = '▸ ', trail = '·' }
opt.termguicolors = true -- Enable colors in terminal
opt.undofile = true --Save undo history
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.joinspaces = false -- No double spaces with join after a dot

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
autocmd(
    { "InsertLeave", "WinEnter" },
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
function CentreCursor()
    local pos = api.nvim_win_get_cursor(0)
    cmd("normal! zz")
    api.nvim_win_set_cursor(0, pos)
end
autocmd(
    {"CursorMoved", "CursorMovedI"},
    { pattern = "*", command = "lua CentreCursor()"}
)
-- opt.scrolloff = 999 -- Lines of context -> This helps mouse wheel up/down

--------------------------------------------------------------------------------
--                             My Custom Wildignore                           --
--------------------------------------------------------------------------------
vim.o.wildignore = vim.o.wildignore .. '*.o'
vim.o.wildignore = vim.o.wildignore .. '*.out,*.so,*.swp,*.zip'
vim.o.wildignore = vim.o.wildignore .. '*\\tmp\\*,*.swp,*.zip,*.exe'

--------------------------------------------------------------------------------
--                             lazy.nvim Bootstrap                            --
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

--------------------------------------------------------------------------------
--                            lazy.nvim Plugin List                           --
--------------------------------------------------------------------------------
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("lazy").setup({
    -- Color Scheme
    {
        "sainnhe/everforest",
        lazy = true,
        priority = 1000,
    },
    -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { theme = "everforest" },
    },
    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    -- Neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {{
            "<F6>",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        }},
        config = {
            window = {
                width = 30,
	    },
        },
    },
    -- vim-illuminate
    "RRethy/vim-illuminate",
    {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
})

-- Color Scheme
vim.cmd("colorscheme everforest")

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon'
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
    },
}

-- TreeSitter
require("nvim-treesitter.configs").setup{
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- vim-illuminate default configuration
require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
})
