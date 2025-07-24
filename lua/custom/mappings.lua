---@type MappingsTable
local M = {}

M.general = {

  n = {
    -- easy enter command mode
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- override core mapping for new buffer
    ["<leader>b"] = { "<nop>", "Buffer prefix" },

    -- toggle theme
    ["<leader>aa"] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle theme"
    },
    ["<leader>gg"] = {
      "<cmd> LazyGit <CR>",
      "LazyGit"
    },
    ["<leader>dk"] = {
      "<cmd> LazyDocker <CR>",
      "LazyDocker"
    }
  },
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    -- new
    ["<leader>ht"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>vt"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle NvimTree
    ["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find things
    ["<leader>fcmd"] = { "<cmd> Telescope commands <CR>", "Find Commands" },
    ["<leader>fch"] = { "<cmd> Telescope command_history <CR>", "Find Command History" },
    ["<leader>fsh"] = { "<cmd> Telescope search_history <CR>", "Find Search History" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Find Keymaps" },
    ["<leader>fr"] = { "<cmd> Telescope registers <CR>", "Find Registers" },

    -- git
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" }, -- find git commit
    ["<leader>fgt"] = { "<cmd> Telescope git_status <CR>", "Git status" },   -- find git status

    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" }, -- find terminal
    
    -- live grep with args
    ["<leader>fw"] = { "<cmd> Telescope live_grep_args <CR>", "Live grep with args" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = { "<nop>", "Close buffer" }, -- remove mapping
    ["<leader>ww"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}


M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["<leader>gnh"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<leader>gph"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>grh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gpvh"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  },
}

M.render_markdown = {
  n = {
    ["<leader>md"] = {
      "<cmd>RenderMarkdown toggle<CR>",
      "Toggle markdown rendering"
    },
  },
}

M.buffer_management = {
  n = {
    ["<leader>bd"] = {
      function()
        local current_buf = vim.api.nvim_get_current_buf()
        local buffers = vim.api.nvim_list_bufs()
        
        for _, buf in ipairs(buffers) do
          -- Skip current buffer, nvim-tree buffer, and special buffers
          if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) then
            local buf_name = vim.api.nvim_buf_get_name(buf)
            local buf_type = vim.api.nvim_buf_get_option(buf, 'buftype')
            
            -- Don't close NvimTree, terminals, or other special buffers
            -- Also don't close unsaved buffers (force = false)
            if not string.match(buf_name, "NvimTree") and
               buf_type ~= 'terminal' and
               buf_type ~= 'nofile' and
               buf_type ~= 'help' then
              vim.api.nvim_buf_delete(buf, { force = false })
            end
          end
        end
      end,
      "Close all buffers except current (skip unsaved)"
    },
  },
}

M.oil = {
  n = {
    ["<leader>-"] = {
      function()
        require("oil").open()
      end,
      "Open oil file explorer"
    },
  },
}

-- more keybinds!

return M
