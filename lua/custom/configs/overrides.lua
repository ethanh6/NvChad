local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "jsonnet",
    "starlark",
    "go",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  fold = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- shell stuff
    "shfmt",

    -- jsonnet stuff
    "jsonnet-language-server",

    -- bazel stuff
    "bazel-language-server",

    -- go stuff
    "gopls",
    "gofumpt",

    -- yaml stuff
    "yaml-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    adaptive_size = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
