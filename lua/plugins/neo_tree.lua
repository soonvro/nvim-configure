return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  init = function() vim.g.neo_tree_remove_legacy_commands = 1 end,
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
}
