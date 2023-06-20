--------------------------------------------------------------------------------
--                                Tab Setting                                 --
--------------------------------------------------------------------------------
vim.opt.tabstop     = 4 --파일에서 <Tab>이 사용하는 공백 수
vim.opt.softtabstop = 4 --편집하는 동안 <Tab>이 사용하는 공백 수
vim.opt.shiftwidth  = 4 -- (자동)들여쓰기 단계에 사용할 공백 수
vim.opt.expandtab   = true -- 탭 대신 공백 사용

--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
local function execute_shell_command(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end

vim.api.nvim_create_user_command(
    'Execute',
    function ()
        local program_name = execute_shell_command("make print-NAME")
        vim.api.nvim_input(string.format(":!./%s", program_name))
    end,
    {}
)
--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n',  '<F9>', ':!make && less<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':Execute<CR>',       { noremap = true, silent = true })
