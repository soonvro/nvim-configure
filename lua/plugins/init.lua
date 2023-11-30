return {
  -- Color Scheme
  {
    "sainnhe/everforest",
    lazy = true,
    priority = 1000,
  },

  -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
  -- Lualine has a section as shown below,
  -- | A | B | C            X | Y | Z |
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "everforest",
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      }
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup{
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- Indent Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup {
        indent = { char = "▏" },
        scope = {
          enabled = true,
          show_start = false,
        },
      }
    end,
  },

  -- Copliot
  "github/copilot.vim",
  -- "jose-elias-alvarez/null-ls.nvim",
}
