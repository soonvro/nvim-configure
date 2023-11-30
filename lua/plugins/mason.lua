return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup {
      -- Where Mason should put its bin location in your PATH. Can be one of:
      -- - "prepend" (default, Mason's bin location is put first in PATH)
      -- - "append" (Mason's bin location is put at the end of PATH)
      -- - "skip" (doesn't modify PATH)
      -- -@type '"prepend"' | '"append"' | '"skip"'
      PATH = "append",
    }
    local vim_map = function(type, key, value)
      vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = false});
    end
    local custom_attach = function(client)
      print("LSP started.");
    --   require'completion'.on_attach(client)
    --   require'diagnostic'.on_attach(client)

      vim_map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
      vim_map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
      vim_map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
      vim_map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
      vim_map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
      vim_map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
      vim_map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
      vim_map('n','<leader>lr','<cmd>lua vim.lsp.buf.rename()<CR>')
      vim_map('n','<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>')
      vim_map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
      -- vim_map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
      -- vim_map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
      -- vim_map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      -- vim_map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
      -- vim_map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
      -- vim_map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
      -- vim_map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    end
    require("mason-lspconfig").setup_handlers {
      function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          on_attach = custom_attach,
          capabilities = { offsetEncoding = "utf-16", },
          -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
      end
    }
    require("mason-lspconfig").setup()

    require("lspconfig").pyright.setup {
      on_attach = custom_attach,
      capabilities = { offsetEncoding = "utf-16", },
      -- turn off reportGeneralTypeIssues
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            -- reportGeneralTypeIssues = false,
          },
        },
      },
    }
  end,
}
