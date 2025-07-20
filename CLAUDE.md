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
- **LSP**: lua-language-server, css-lsp, html-lsp, typescript-language-server, clangd, jsonnet-language-server, bazel-language-server, deno
- **Formatters**: stylua, prettier, clang-format, shfmt
- **Treesitter**: Supports vim, lua, html, css, javascript, typescript, tsx, c, markdown, jsonnet, starlark

### Additional Plugins
- **LazyGit**: Git TUI integration (`<leader>gg`)
- **LazyDocker**: Docker TUI integration (`<leader>dk`)
- **nvim-neoclip.lua**: Clipboard manager
- **numb.nvim**: Line number peek
- **nightfox.nvim**: Additional theme option
- **conform.nvim**: Code formatting
- **GitHub Copilot**: AI code completion (disabled by default, `<C-l>` to accept)

## Key Mappings

### Custom Mappings
- `<leader>aa`: Toggle between light/dark themes
- `<leader>gg`: Open LazyGit
- `<leader>dk`: Open LazyDocker
- `<leader>tt`: Toggle NvimTree
- `<leader>ww`: Close current buffer (custom override of default `<leader>x`)
- `<C-\>`: Toggle floating terminal

### Git Integration
- `<leader>gnh/gph`: Navigate next/previous git hunks
- `<leader>grh`: Reset git hunk
- `<leader>gpvh`: Preview git hunk

### Telescope Extensions
- `<leader>fcmd`: Find commands
- `<leader>fch`: Find command history  
- `<leader>fk`: Find keymaps
- `<leader>fgc`: Git commits
- `<leader>fgt`: Git status

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