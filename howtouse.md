# Personal NvChad Configuration Guide

This document provides a comprehensive guide to using this personalized NvChad v2.0 Neovim configuration.

## Overview

This is a highly customized NvChad v2.0 setup with extensive language server support, custom keybindings, and development tools integration. The configuration is optimized for web development, systems programming, and general text editing.

## Key Tools and Technologies

### LSP (Language Server Protocol)
LSP provides intelligent code completion, error checking, go-to-definition, and other IDE-like features.

**Installed Language Servers:**
- `lua_ls` - Lua language server
- `ts_ls` - TypeScript/JavaScript language server  
- `html` - HTML language server
- `cssls` - CSS language server
- `clangd` - C/C++ language server
- `jsonls` - JSON language server
- `jsonnet_ls` - Jsonnet language server
- `bzl` - Bazel language server
- `bashls` - Bash language server
- `vimls` - Vim language server
- `pyright` - Python language server

### Mason
Mason is a package manager for LSP servers, formatters, linters, and DAP servers. It automatically installs and manages these tools.

**Access Mason:** `:Mason`

### Treesitter
Treesitter provides advanced syntax highlighting, code folding, and text objects based on syntax trees.

**Supported Languages:**
- vim, lua, html, css, javascript, typescript, tsx, c, markdown, jsonnet, starlark (bazel)

### Formatters
Code formatters ensure consistent code style:
- `stylua` - Lua formatter
- `prettier` - Web technologies formatter (JS/TS/HTML/CSS)
- `clang-format` - C/C++ formatter
- `shfmt` - Shell script formatter

## Color Themes

**Current Theme:** `ayu_dark`
**Toggle Themes:** `everforest_light` ↔ `ayu_dark`
**Switch Theme:** `<leader>aa`

Additional theme available: `nightfox.nvim`

## Keybindings

### General Navigation
- `<leader>aa` - Toggle between light/dark themes
- `<leader>tt` - Toggle NvimTree file explorer
- `<leader>ww` - Close current buffer
- `<leader>bd` - Close all buffers except current (skip unsaved)
- `<C-\>` - Toggle floating terminal

### Git Integration (LazyGit)
- `<leader>gg` - Open LazyGit interface
- `<leader>gnh` - Jump to next git hunk
- `<leader>gph` - Jump to previous git hunk
- `<leader>grh` - Reset git hunk
- `<leader>gpvh` - Preview git hunk

### Docker Integration
- `<leader>dk` - Open LazyDocker interface

### Telescope (Fuzzy Finder)
- `<leader>ff` - Find files
- `<leader>fa` - Find all files (including hidden)
- `<leader>fw` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Help pages
- `<leader>fo` - Find old files
- `<leader>fcmd` - Find commands
- `<leader>fch` - Find command history
- `<leader>fk` - Find keymaps
- `<leader>fgc` - Git commits
- `<leader>fgt` - Git status

### Terminal Management
- `<C-\>` - Toggle floating terminal
- `<leader>ht` - New horizontal terminal
- `<leader>vt` - New vertical terminal

### Buffer Navigation
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

### AI Code Completion (Copilot)
- `<C-l>` - Accept Copilot suggestion (disabled by default)

### Markdown Rendering
- `<leader>md` - Toggle markdown rendering

## Plugins Used

### Core NvChad Plugins
- `nvim-lspconfig` - LSP configuration
- `mason.nvim` - Package manager for LSP/formatters/linters
- `nvim-treesitter` - Syntax highlighting and parsing
- `nvim-tree.lua` - File explorer
- `telescope.nvim` - Fuzzy finder
- `nvim-cmp` - Autocompletion engine

### Custom Added Plugins
- `conform.nvim` - Code formatting
- `github/copilot.vim` - AI code completion (disabled)
- `kdheepak/lazygit.nvim` - Git TUI integration
- `crnvl96/lazydocker.nvim` - Docker TUI integration
- `AckslD/nvim-neoclip.lua` - Clipboard manager
- `nacro90/numb.nvim` - Line number peek
- `EdenEast/nightfox.nvim` - Additional color theme
- `MeanderingProgrammer/render-markdown.nvim` - Live markdown rendering

## File Structure and Purpose

```
~/.config/nvim/
├── init.lua                                  # Entry point, loads core and custom configs
├── LICENSE                                   # GPL-3.0 license file
├── CLAUDE.md                                 # AI assistant instructions
├── howtouse.md                               # This documentation file
├── lazy-lock.json                            # Plugin version lockfile
└── lua/
    ├── core/                                 # NvChad core system files
    │   ├── bootstrap.lua                     # Plugin manager bootstrap
    │   ├── default_config.lua                # Default NvChad configuration
    │   ├── init.lua                          # Core initialization and autocommands
    │   ├── mappings.lua                      # Default NvChad keybindings
    │   └── utils.lua                         # Utility functions
    ├── custom/                               # User customizations directory
    │   ├── README.md                         # Custom config documentation
    │   ├── chadrc.lua                        # Main custom configuration file
    │   ├── init.lua                          # Custom initialization
    │   ├── mappings.lua                      # Custom keybindings
    │   ├── plugins.lua                       # Custom plugin specifications
    │   ├── highlights.lua                    # Custom theme highlights
    │   └── configs/                          # Plugin configuration overrides
    │       ├── conform.lua                   # Code formatter configuration
    │       ├── lspconfig.lua                 # LSP server configurations
    │       └── overrides.lua                 # Mason, Treesitter, NvimTree overrides
    └── plugins/                              # Default NvChad plugin configs
        ├── init.lua                          # Plugin specifications
        └── configs/                          # Individual plugin configurations
            ├── cmp.lua                       # Completion configuration
            ├── lazy_nvim.lua                 # Lazy.nvim setup
            ├── lspconfig.lua                 # Base LSP configuration
            ├── mason.lua                     # Mason configuration
            ├── nvimtree.lua                  # File explorer configuration
            ├── others.lua                    # Miscellaneous plugin configs
            ├── telescope.lua                 # Fuzzy finder configuration
            └── treesitter.lua                # Syntax highlighting configuration
```

## Which-Key Integration

This configuration includes which-key descriptions for prefix categories. When you press `<Space>` (leader key), you'll see:

- `󰓩 Buffer` - Buffer-related commands (`<leader>b*`)
- `󰈞 Find` - Search/find commands (`<leader>f*`)
- `󰊢 Git` - Git operations (`<leader>g*`) 
- `󰖲 Window` - Window management (`<leader>w*`)
- `󰹻 Toggle/Terminal` - Toggle commands (`<leader>t*`)
- `󰘦 Code` - Code actions (`<leader>c*`)
- ` LSP` - LSP commands (`<leader>l*`)
- `󰤋 Horizontal` - Horizontal splits (`<leader>h*`)
- `󰤌 Vertical` - Vertical splits (`<leader>v*`)

## Configuration Management

### Adding New Language Servers
1. **Add to Mason** - Edit `lua/custom/configs/overrides.lua:25-46`
   ```lua
   M.mason = {
     ensure_installed = {
       "new-language-server",  -- Add here
     }
   }
   ```

2. **Add to LSP Config** - Edit `lua/custom/configs/lspconfig.lua:7`
   ```lua
   local servers = { "html", "cssls", "new_ls" }  -- Add here
   ```

### Adding New Formatters
1. **Add to Mason** - Edit `lua/custom/configs/overrides.lua:25-46`
2. **Configure Formatter** - Edit `lua/custom/configs/conform.lua`

### Adding Treesitter Languages
Edit `lua/custom/configs/overrides.lua:4-16`:
```lua
M.treesitter = {
  ensure_installed = {
    "vim", "lua", "new_language",  -- Add here
  }
}
```

### Changing Themes
Edit `lua/custom/chadrc.lua:8-9`:
```lua
M.ui = {
  theme = "current_theme",                           -- Line 8: Current theme
  theme_toggle = { "light_theme", "dark_theme" },   -- Line 9: Toggle themes
}
```

### Adding New Keybindings
Edit `lua/custom/mappings.lua` and add to appropriate sections:
```lua
M.general = {
  n = {
    ["<leader>new"] = { "<cmd>NewCommand<CR>", "Description" },
  }
}
```

### Adding New Plugins
Edit `lua/custom/plugins.lua:4-127`:
```lua
local plugins = {
  {
    "author/plugin-name",
    config = function()
      require("plugin-name").setup()
    end,
  },
}
```

### Telescope Configuration
Edit telescope style in `lua/custom/chadrc.lua:14`:
```lua
telescope = { style = "bordered" },  -- or "borderless"
```

### Dashboard Settings
Edit dashboard settings in `lua/custom/chadrc.lua:16-18`:
```lua
nvdash = {
  load_on_startup = true,  -- Show dashboard on startup
},
```

## Plugin Management

### Installing New Packages
1. Restart Neovim after config changes
2. Run `:Mason` to install LSP servers/formatters
3. Run `:TSInstall <language>` for new Treesitter parsers
4. Run `:Lazy sync` to update plugins

### Updating Everything
- `:Lazy sync` - Update all plugins
- `:Mason` then `U` - Update all Mason packages
- `:TSUpdate` - Update Treesitter parsers

## Development Workflow

1. **File Navigation:** Use `<leader>ff` to find files quickly
2. **Code Search:** Use `<leader>fw` to search within files
3. **Git Management:** Use `<leader>gg` for LazyGit interface
4. **Docker Management:** Use `<leader>dk` for LazyDocker interface
5. **Terminal Access:** Use `<C-\>` for floating terminal
6. **Theme Switching:** Use `<leader>aa` based on lighting conditions

## Troubleshooting

### LSP Not Working
1. Check if language server is installed: `:Mason`
2. Verify server is in config: `lua/custom/configs/lspconfig.lua:7`
3. Restart Neovim after changes

### Formatter Not Working
1. Check if formatter is installed: `:Mason`
2. Verify formatter config: `lua/custom/configs/conform.lua`
3. Use `:ConformInfo` to debug

### Syntax Highlighting Issues
1. Check if language is installed: `:TSInstallInfo`
2. Add language to Treesitter config if missing
3. Run `:TSUpdate` to update parsers

## Advanced Customization

For advanced users, you can:
- Modify core NvChad files (not recommended for updates)
- Create custom highlight groups in `lua/custom/highlights.lua`
- Add custom autocommands in `lua/custom/init.lua`
- Override any NvChad default in the `custom/` directory

Remember to backup your configuration before making major changes!
