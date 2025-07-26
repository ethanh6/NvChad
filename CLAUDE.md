# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a **NvChad v2.0** based Neovim configuration with extensive customizations. The configuration follows a modular structure:

- **Core system**: Located in `lua/core/` - handles NvChad's base functionality including bootstrap, mappings, and utilities
- **Custom configuration**: Located in `lua/custom/` - contains all user customizations and overrides
- **Plugin system**: Uses lazy.nvim for plugin management with configurations in `lua/plugins/configs/`

## Key Configuration Files

### Primary Configuration
- `init.lua`: Entry point that loads core, custom init, mappings, and bootstraps lazy.nvim
- `lua/custom/chadrc.lua`: Main custom configuration file defining UI theme, telescope style, and plugin/mapping paths
- `lua/custom/plugins.lua`: Custom plugin specifications and overrides

### Configuration Architecture
- `lua/custom/configs/overrides.lua`: Contains overrides for Mason, Treesitter, and nvim-tree configurations
- `lua/custom/configs/lspconfig.lua`: LSP server configurations
- `lua/custom/configs/conform.lua`: Code formatting configurations
- `lua/custom/mappings.lua`: Custom key mappings for various plugins and functions

## Current Theme & UI Configuration

- **Theme**: "everforest_light" with toggle to "ayu_dark" 
- **Telescope**: Bordered style (overrides default borderless)
- **Dashboard**: Enabled with load_on_startup = true
- **Statusline**: Default theme with default separators

## Installed Plugins & Tools

### Development Tools
- **LSP**: lua-language-server, css-lsp, html-lsp, typescript-language-server, clangd, jsonnet-language-server, bazel-language-server, deno, yaml-language-server
- **Formatters**: stylua, prettier, clang-format, shfmt
- **Treesitter**: Supports vim, lua, html, css, javascript, typescript, tsx, c, markdown, jsonnet, starlark, go, yaml

### Additional Plugins
- **LazyGit**: Git TUI integration (`<leader>gg`)
- **LazyDocker**: Docker TUI integration (`<leader>dk`)
- **nvim-neoclip.lua**: Clipboard manager
- **numb.nvim**: Line number peek
- **nightfox.nvim, catppuccin, tokyonight**: Additional theme options
- **conform.nvim**: Code formatting
- **GitHub Copilot**: AI code completion (disabled by default, `<C-l>` to accept)
- **nvim-surround**: Text object manipulation for surrounding characters
- **go.nvim**: Enhanced Go development with LSP and tools
- **render-markdown.nvim**: Live markdown rendering with icons and formatting
- **blink.cmp**: Fast completion engine (replaces nvim-cmp)
- **oil.nvim**: File explorer that edits filesystem like a buffer
- **oil-git-status.nvim**: Git status integration for oil.nvim

## Key Mappings

### Custom Mappings
- `<leader>aa`: Toggle between light/dark themes
- `<leader>gg`: Open LazyGit
- `<leader>dk`: Open LazyDocker
- `<leader>tt`: Toggle NvimTree
- `<leader>ww`: Close current buffer (custom override of default `<leader>x`)
- `<C-\>`: Toggle floating terminal
- `<leader>-`: Open oil.nvim file explorer
- `<leader>bd`: Close all buffers except current (skip unsaved)
- `<leader>md`: Toggle markdown rendering

### Oil.nvim File Explorer
- `<leader>-`: Open oil.nvim
- `q`: Close oil buffer without quitting Neovim (custom keymap)
- `<CR>`: Open file/directory
- `<C-s>`: Open in vertical split
- `<C-h>`: Open in horizontal split
- `<C-t>`: Open in new tab
- `<C-p>`: Preview file
- `<C-c>`: Close oil
- `<C-l>`: Refresh
- `-`: Go to parent directory
- `g.`: Toggle hidden files
- `gs`: Change sort order
- `gx`: Open with external program

### Git Integration
- `<leader>gnh/gph`: Navigate next/previous git hunks
- `<leader>grh`: Reset git hunk
- `<leader>gpvh`: Preview git hunk

### Telescope Extensions
- `<leader>fcmd`: Find commands
- `<leader>fch`: Find command history
- `<leader>fsh`: Find search history
- `<leader>fk`: Find keymaps
- `<leader>fr`: Find registers
- `<leader>fgc`: Git commits
- `<leader>fgt`: Git status
- `<leader>ft`: Pick hidden terminal

### Buffer Management
- `<S-h>/<S-l>`: Navigate previous/next buffer
- `<leader>ww`: Close current buffer
- `<leader>bd`: Close all buffers except current

## Plugin Configuration Details

### Oil.nvim File Explorer
- **File explorer mode**: `default_file_explorer = false` (manual activation only)
- **Columns displayed**: icon, permissions, size, mtime
- **Hidden files**: Enabled by default (`show_hidden = true`)
- **Git integration**: Uses `oil-git-status.nvim` for git status indicators
- **Custom quit behavior**: `q` key safely closes oil without quitting Neovim

### Blink.cmp Completion
- **Completion engine**: Replaces nvim-cmp for better performance
- **Keymap preset**: "default" (tab to navigate, enter to accept)
- **Sources**: LSP, path, snippets, buffer
- **Signature help**: Enabled
- **Autopairs integration**: Automatic via nvim-autopairs

### Markdown Rendering
- **Live rendering**: `render-markdown.nvim` with icons and styling
- **Headings**: Custom icons for different heading levels
- **Code blocks**: Full styling with borders
- **Checkboxes**: Custom unchecked/checked icons
- **Toggle**: `<leader>md` to enable/disable rendering

### YAML Folding
- **Treesitter-based folding**: Uses syntax-aware folding for YAML files
- **Configuration**: `lua/custom/init.lua` - FileType autocmd for YAML
- **Default behavior**: Folding disabled by default (`foldenable = false`)
- **Fold method**: Expression-based using `nvim_treesitter#foldexpr()`

## Configuration Management

### Theme Customization
Themes are configured in `lua/custom/chadrc.lua` with custom highlights in `lua/custom/highlights.lua`.

### Plugin Management
- Add new plugins to `lua/custom/plugins.lua`
- Plugin overrides go in `lua/custom/configs/overrides.lua`
- LSP configurations in `lua/custom/configs/lspconfig.lua`

### Key Mapping Management
All custom mappings are defined in `lua/custom/mappings.lua` following the NvChad MappingsTable structure.

## Development Workflow

1. **Configuration changes**: Edit files in `lua/custom/` directory
2. **Plugin management**: Use lazy.nvim interface (`:Lazy`) or edit `lua/custom/plugins.lua`
3. **Theme switching**: Use `<leader>aa` or modify `chadrc.lua`
4. **LSP/Tool management**: Configure in `overrides.lua` and run `:Mason` to install/manage tools

The configuration is currently on the "personalization" branch with recent commits focused on adding lazydocker, updating LSP configurations, and fixing deprecated settings.
