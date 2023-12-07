return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  -- init = function() vim.g.neo_tree_remove_legacy_commands = 1 end,
  keys = {
    {
      "<F6>",
      function()
        vim.api.nvim_cmd({
          cmd = "Neotree",
          args = {
            string.format("dir=%s", vim.loop.cwd()),
            "toggle",
            "reveal",
          },
        }, {})
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<F30>", -- ctrl+F6
      function()
        vim.api.nvim_cmd({
          cmd = "Neotree",
          args = {
            "source=buffers",
            "toggle",
            "reveal",
          },
        }, {})
      end,
      desc = "Explorer NeoTree (buffers)",
    }
  },
  config = function()
    require("neo-tree").setup{
      window = {
        width = 30,
      },
    }
  end,
}
