# Keybindings Reference

This document provides a comprehensive reference for all keybindings in this NvChad configuration.

## Where to Find Keybindings

### Configuration Files
- **Core NvChad keybindings:** `lua/core/mappings.lua`
- **Custom keybindings:** `lua/custom/mappings.lua`
- **Main configuration:** `lua/custom/chadrc.lua` (line 24: `M.mappings = require "custom.mappings"`)

### View Keybindings in Neovim
- `:NvCheatsheet` - Opens NvChad's interactive cheatsheet
- `<leader>ch` - Shortcut to open cheatsheet
- `<leader>fk` - Find keymaps with Telescope
- `:map` - Show all mappings
- `:map <leader>` - Show all leader mappings

## Keybinding System Structure

This configuration uses a hierarchical prefix system for organizing keybindings:

### **`<leader>f*` - Find/Search Commands (Telescope)**
| Keybinding | Description |
|------------|-------------|
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files (including hidden) |
| `<leader>fw` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help pages |
| `<leader>fo` | Find old files |
| `<leader>fz` | Find in current buffer |
| `<leader>fcmd` | Find commands |
| `<leader>fch` | Find command history |
| `<leader>fsh` | Find search history |
| `<leader>fk` | Find keymaps |
| `<leader>fr` | Find registers |
| `<leader>fgc` | Find git commits |
| `<leader>fgt` | Find git status |
| `<leader>ft` | Find terminals |

### **`<leader>g*` - Git Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>gg` | Open LazyGit interface |
| `<leader>gnh` | Jump to next git hunk |
| `<leader>gph` | Jump to previous git hunk |
| `<leader>grh` | Reset git hunk |
| `<leader>gpvh` | Preview git hunk |
| `<leader>gt` | Git status (telescope) |
| `<leader>gb` | Git blame |

### **`<leader>w*` - Window/Workspace Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>ww` | Close current buffer |
| `<leader>wa` | Save all files |
| `<leader>wr` | Rotate windows |
| `<leader>wl` | Focus last window |
| `<leader>wK` | Move window up |
| `<leader>wk` | Move window down |

### **`<leader>b*` - Buffer Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>b` | Buffer prefix (no-op) |
| `<leader>bd` | Close all buffers except current (skip unsaved) |

### **`<leader>t*` - Toggle/Terminal Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>tt` | Toggle NvimTree file explorer |
| `<leader>th` | Telescope themes |
| `<leader>td` | Toggle diagnostics |

### **`<leader>h*` & `<leader>v*` - Split Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>h` | Create horizontal split |
| `<leader>v` | Create vertical split |
| `<leader>ht` | New horizontal terminal |
| `<leader>vt` | New vertical terminal |

### **`<leader>c*` - Code/LSP Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>ch` | Open mapping cheatsheet |
| `<leader>ca` | LSP code actions |
| `<leader>cc` | Toggle comment |

### **`<leader>l*` - LSP Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>ls` | LSP document symbols |
| `<leader>lf` | LSP format document |

### **Single Letter Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>aa` | Toggle between light/dark themes |
| `<leader>dk` | Open LazyDocker interface |
| `<leader>e` | Focus NvimTree |
| `<leader>q` | Quit window |
| `<leader>x` | Close buffer (disabled in custom config) |
| `<leader>md` | Toggle markdown rendering |

### **Other Commands**
| Keybinding | Description |
|------------|-------------|
| `<leader>n` | Toggle line numbers |
| `<leader>rn` | Toggle relative line numbers |
| `<leader>ra` | LSP rename symbol |
| `<leader>fm` | Format buffer |
| `<leader>ma` | Telescope marks |
| `<leader>pt` | Pick hidden terminal |

## Terminal & Navigation

### Terminal Management
| Keybinding | Description |
|------------|-------------|
| `<C-\>` | Toggle floating terminal |
| `<leader>ht` | New horizontal terminal |
| `<leader>vt` | New vertical terminal |

### Buffer Navigation
| Keybinding | Description |
|------------|-------------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader>ww` | Close current buffer |
| `<leader>bd` | Close all buffers except current |

### File Explorer
| Keybinding | Description |
|------------|-------------|
| `<leader>tt` | Toggle NvimTree |
| `<leader>e` | Focus NvimTree |

## Special Features

### AI Code Completion (Copilot)
| Keybinding | Description |
|------------|-------------|
| `<C-l>` | Accept Copilot suggestion (disabled by default) |

### Markdown Rendering
| Keybinding | Description |
|------------|-------------|
| `<leader>md` | Toggle markdown rendering |

## Adding New Keybindings

### For Custom Keybindings
Edit `lua/custom/mappings.lua` and add to the appropriate section:

```lua
M.your_section = {
  n = {
    ["<leader>xyz"] = { "<cmd>YourCommand<CR>", "Description" },
  },
}
```

### Keybinding Structure
```lua
["<leader>key"] = {
  function()
    -- Lua function
  end,
  "Description for cheatsheet"
},
-- OR
["<leader>key"] = { "<cmd>Command<CR>", "Description" },
```

### Override Core Keybindings
To disable or change core NvChad keybindings, add them to your custom mappings:

```lua
["<leader>key"] = { "<nop>", "Disabled" },  -- Disable
["<leader>key"] = { "<cmd>NewCommand<CR>", "New function" },  -- Override
```

## Tips

1. **Leader Key:** The leader key is `<Space>` by default in NvChad
2. **Cheatsheet:** Use `<leader>ch` to see all available keybindings
3. **Search Keybindings:** Use `<leader>fk` to search through keymaps
4. **Prefix System:** Follow the established prefix patterns when adding new keybindings
5. **Documentation:** Always add descriptive text for new keybindings

## Configuration Locations

- **Main custom config:** `lua/custom/chadrc.lua:24`
- **Custom mappings:** `lua/custom/mappings.lua`
- **Core mappings:** `lua/core/mappings.lua` (read-only, override in custom)
- **Plugin-specific mappings:** Individual sections in `lua/custom/mappings.lua`

Remember: Custom mappings override core mappings, so you can safely customize without modifying core files.