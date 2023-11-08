--------------------------------------------------------------------------------
--                                Tab Setting                                 --
--------------------------------------------------------------------------------
vim.opt.softtabstop = 2 --편집하는 동안 <Tab>이 사용하는 공백 수
vim.opt.shiftwidth  = 2 -- (자동)들여쓰기 단계에 사용할 공백 수
vim.opt.expandtab   = true -- 탭 대신 공백 사용
vim.opt.tabstop     = 4 --파일에서 <Tab>이 사용하는 공백 수

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
        local program_name = execute_shell_command("cd build && make print-name | sed -n '1p' | tr -d '\n'")
        vim.api.nvim_input(string.format(":terminal ./build/%s", program_name))
    end,
    {}
)

vim.api.nvim_create_user_command(
    'GdbCompile',
    function ()
        execute_shell_command("cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make")
    end,
    {}
)


--------------------------------------------------------------------------------
--                             My Custom Mapping                              --
--------------------------------------------------------------------------------
-- function keys
vim.api.nvim_set_keymap('n', '<F9>', ':terminal cmake -B ./build && make -C ./build -j8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':Execute<CR>',       { noremap = true, silent = true })
