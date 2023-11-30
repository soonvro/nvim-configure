return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        file_ignore_patterns = {
          "build/",
          "%.o",
          "%.d",
          "%.out",
        },
        layout_config = {
          horizontal = {
            preview_cutoff = 0,
          },
        },
        mappings = {
          i = {
            ['<Right>'] = require('telescope.actions.layout').toggle_preview,
          },
        },
      }
    }
  end,
  keys = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}
