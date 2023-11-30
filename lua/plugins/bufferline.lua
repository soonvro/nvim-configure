return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function() vim.opt.termguicolors = true end,
  config = function()
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
  end,
}
