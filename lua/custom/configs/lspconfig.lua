local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Servers with default configuration
local servers = { "html", "cssls", "ts_ls", "clangd", "jsonls", "bashls", "vimls", "pyright", "jsonnet_ls", "bzl" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Language servers with custom configuration
-- All custom LSP configurations should go here

-- Lua Language Server with enhanced settings
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

-- YAML Language Server with schema validation
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
      },
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/package.json"] = "/package.json",
        ["https://json.schemastore.org/docker-compose.yml"] = "/docker-compose*.yml",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  },
}

-- TypeScript/JavaScript with additional settings
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      preferences = {
        disableSuggestions = false,
      }
    }
  }
}

-- Go Language Server with custom settings
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

