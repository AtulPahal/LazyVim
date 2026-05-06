# 🚀 Personal Neovim Configuration

A modern, fast, and feature-rich Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim). This setup is tailored for a highly productive development environment with integrated AI capabilities, REPL support, and robust plugin management.

## ✨ Features

- **Base:** Powered by **LazyVim** for a rock-solid, extensible foundation.
- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) for lightning-fast startup and easy plugin management.
- **Theme:** [OneDark](https://github.com/navarasu/onedark.nvim) (Darker style) for a sleek, comfortable coding experience.
- **AI-Powered:** Integrated with [avante.nvim](https://github.com/yetone/avante.nvim), configured with a custom high-performance provider (Stepfun/NVIDIA).
- **Interactive REPL:** [iron.nvim](https://github.com/Vigemere/iron.nvim) for a powerful interactive development workflow.
- **Environment Management:** Custom `.env` loader and [dotenv.nvim](https://github.com/ellisonleao/dotenv.nvim) support.
- **Auto-save:** Never lose work with integrated autosave functionality.
- **Package Management:** [Mason.nvim](https://github.com/mason-org/mason.nvim) for easy installation of LSP servers, DAP adapters, linters, and formatters.

## 📁 Project Structure

```text
~/.config/nvim
├── init.lua              # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua  # Custom autocommands
│   │   ├── keymaps.lua    # Custom keybindings
│   │   ├── lazy.lua      # Plugin manager bootstrap
│   │   └── options.lua   # Neovim options & .env loader
│   └── plugins/          # Plugin specifications & overrides
│       ├── avante.lua    # AI integration config
│       ├── iron.lua      # REPL configuration
│       ├── theme.lua     # Theme & UI settings
│       └── ...           # Other plugin configs
└── ...
```

## 📦 Installation

1. **Backup your existing configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this repository:**
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Setup Environment Variables:**
   Create a `.env` file in `~/.config/nvim/` to store your API keys:
   ```bash
   touch ~/.config/nvim/.env
   ```
   Example `.env` content:
   ```env
   NVIDIA_API_KEY=your_key_here
   ```

4. **Launch Neovim:**
   ```bash
   nvim
   ```
   Plugins will automatically install on the first run.

## 🛠 Customizations

### Environment Variable Loader
This configuration includes a custom loader in `lua/config/options.lua` that automatically reads and sets environment variables from `~/.config/nvim/.env` at startup. This is particularly useful for AI providers like Avante.

### AI Provider (Avante)
The AI assistant is configured to use the **Stepfun Flash** model via NVIDIA's API for low-latency, deterministic responses. You can customize the provider in `lua/plugins/avante.lua`.

## ⌨️ Keymaps

This config inherits all [LazyVim default keymaps](https://www.lazyvim.org/keymaps). Custom keymaps can be found and added in `lua/config/keymaps.lua`.

---
*Built with ❤️ and Neovim.*
