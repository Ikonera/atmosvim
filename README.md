# Neovim configuration

## Major plugins

1. Plugin manager : [Lazy.nvim](https://github.com/folke/lazy.nvim.git)

- To update installed plugins, run `:Lazy update`.
- To install plugins, run `:Lazy install <name_of_your_plugin>` or modify the `lua/atmosvim/<plugin_name>` file.

2. Lsp - Language Server Protocol : [Neovim-lspconfig](), [Mason.nvim](https://github.com/williamboman/mason.nvim.git), [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim.git)

- To install new LSP servers, run `:Mason` and select the LSP that you want.

3. Explorer / file picker : [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)

## Useful files

- Mappings : `lua/mappings.lua`
- Completion : `lua/atmosvim/nvim-lsp.lua`
- Telescope : `lua/atmosvim/telescope.lua`
- Code formatting : `lua/atmosvim/formatter.lua`

## Some tips

### Updates

If you want to keep your Neovim configuration updated with this repo, you should create a symlink using the following command :

```bash
# With SSH
git clone git@github.com:ikonera/atmosvim.git
# With HTTP
git clone https://github.com/ikonera/atmosvim.git

ln -s /<absolute_path>/atmosvim $HOME/.config/nvim
```

Then

```bash
cd path/to/atmosvim
git pull
```

### Themes

If you want to change the colorscheme, you can make it with Telescope by running `:Telescope builtin` > `colorscheme` then selecting your choosed one.

Preinstalled themes with this repo :

- [Catppuccin (mocha)](https://github.com/catppuccin/catppuccin)

To install your own :

- Configure it by modifying the `lua/atmosvim/theme.lua` file.
- And replace the theme name at the end of the file !
