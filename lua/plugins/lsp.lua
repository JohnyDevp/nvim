return { "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require('mason').setup()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
        ensure_installed = {
          "pyright",
          "clangd"
        }
    }
    require("lspconfig").pyright.setup {
        capabilities = capabilities,
    }
    vim.diagnostic.config({
      update_in_insert = true,
      severity_sort = true,
      virtual_text = true,
      underline = true
    })

  end
}
