local overrides = require("custom.configs.overrides")

--@type NvPluginSpec[]cusplug
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "github/copilot.vim",
    enabled = false,
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  {
    'nacro90/numb.nvim',
    lazy = false,
    config = function()
      require('numb').setup()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha (darkest)
        transparent_background = false,
        integrations = {
          nvimtree = true,
          telescope = {
            enabled = true,
            style = "nvchad"
          },
          which_key = true,
          treesitter = true,
          mason = true,
          -- cmp = true, -- Disabled for blink.cmp
          gitsigns = true,
          markdown = true,
        }
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, night (darkest), day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
        },
        integrations = {
          nvimtree = true,
          telescope = true,
          which_key = true,
          treesitter = true,
          mason = true,
          -- cmp = true, -- Disabled for blink.cmp
          gitsigns = true,
        }
      })
    end,
  },
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- Already included in NvChad
    },
    ft = "markdown",
    opts = {
      -- Configure rendering options
      heading = {
        -- Add icons to headings
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        -- Enable code block rendering
        enabled = true,
        sign = true,
        style = "full",
        border = "thin",
      },
      checkbox = {
        -- Enable checkbox rendering
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
      bullet = {
        -- Enable bullet point rendering
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- Add nvim-autopairs for better integration
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- Setup autopairs integration with blink.cmp
          local has_blink, blink = pcall(require, "blink.cmp")
          if has_blink then
            -- blink.cmp handles autopairs integration automatically
            -- No additional setup required
          end
        end,
      },
    },
    -- use a release tag to download pre-built binaries
    version = "v0.*",
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" in the README for full documentation on how to define
      -- your own keymap.
      keymap = { preset = "default" },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing and ensures icons are aligned
        nerd_font_variant = "mono"
      },

      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },

      -- experimental signature help support
      signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },
  {
    "refractalize/oil-git-status.nvim",
    config = function()
      require("oil-git-status").setup({
        show_ignored = true, -- show files that match gitignore patterns
        -- Optional: customize symbols for different git status indicators
        symbols = {
          index = {
            ["A"] = "󰈞", -- Added
            ["M"] = "󰏫", -- Modified
            ["D"] = "", -- Deleted
            ["R"] = "", -- Renamed
            ["C"] = "󰆏", -- Copied
            ["U"] = "", -- Unmerged
            ["?"] = "", -- Untracked
            [" "] = " ", -- Unchanged
          },
          working_tree = {
            ["A"] = "", -- Added
            ["M"] = "", -- Modified
            ["D"] = "", -- Deleted
            ["R"] = "", -- Renamed
            ["C"] = "󰆏", -- Copied
            ["U"] = "", -- Unmerged
            ["?"] = "", -- Untracked
            [" "] = " ", -- Unchanged
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      local lga_actions = require("telescope-live-grep-args.actions")
      require("telescope").setup({
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
              },
            },
            -- ... also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_config = { mirror=true }, -- mirror preview pane
          }
        }
      })
      require("telescope").load_extension("live_grep_args")
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Already included in NvChad
    },
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = false,
      -- Id is automatically added at the beginning, and name at the end
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "yes:2",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
      delete_to_trash = false,
      -- Skip the confirmation popup for simple operations (:help oil.skip-confirm)
      skip_confirm_for_simple_edits = false,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,
      -- Oil will automatically delete hidden buffers after this delay
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        autosave_changes = false,
      },
      -- Constrain the cursor to the editable parts of the oil buffer
      constrain_cursor = "editable",
      -- Set to true to watch the filesystem for changes and reload oil
      watch_for_changes = false,
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
        -- Custom close that doesn't quit Neovim
        ["q"] = function()
          -- local oil = require("oil")
          -- local bufnr = vim.api.nvim_get_current_buf()
          -- Check if there are other non-oil buffers
          local buffers = vim.api.nvim_list_bufs()
          local non_oil_buffers = 0
          for _, buf in ipairs(buffers) do
            if vim.api.nvim_buf_is_loaded(buf) and 
               vim.api.nvim_buf_get_option(buf, 'buflisted') and
               vim.api.nvim_buf_get_option(buf, 'filetype') ~= 'oil' then
              non_oil_buffers = non_oil_buffers + 1
            end
          end
          
          if non_oil_buffers > 0 then
            -- Close oil buffer and return to previous buffer
            vim.cmd('bprevious')
          else
            -- If no other buffers, create a new empty buffer
            vim.cmd('enew')
          end
        end,
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          -- return vim.startswith(name, ".")
          local m = name:match("^%.")
          return m ~= nil
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      -- Configuration for the actions floating preview window
      preview_win = {
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
        -- How to open the preview window "load"|"scratch"|"fast_scratch"
        preview_method = "fast_scratch",
        -- A function that returns true to disable preview on a file e.g. to avoid lag
        disable_preview = function(filename)
          return false
        end,
        -- Window-local options to use for preview window buffers
        win_options = {},
      },
      -- Configuration for the floating SSH window
      ssh = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },

    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/neorg/notes",
                projects = "~/neorg/projects",
                journal = "~/neorg/journal",
              },
              default_workspace = "notes",
              index = "index.norg",
            },
          },
          ["core.journal"] = {
            config = {
              workspace = "journal",
              strategy = "nested",
            },
          },
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extensions = "all",
            },
          },
          ["core.integrations.telescope"] = {},
        },
      })
    end,
  },
  -- {
  --   "nvzone/timerly",
  --   dependencies = {
  --     "nvzone/volt",
  --   },
  --   cmd = "TimerlyToggle"
  -- }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
