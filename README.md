# 🚀 Antidote Zsh Setup

A complete, high-performance Zsh configuration toolkit featuring the **Antidote** plugin manager, **Starship** prompt, and modern CLI tools. Designed to replace Oh My Zsh with a significantly faster and more efficient setup.

![Shell](https://img.shields.io/badge/Shell-Zsh-green?style=flat-square&logo=gnu-bash)
![Platform](https://img.shields.io/badge/Platform-macOS-blue?style=flat-square&logo=apple)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

## ✨ Features

- **⚡ Ultra-fast startup** - ~80% faster than Oh My Zsh (50-150ms vs 500-1000ms)
- **🔌 Antidote plugin manager** - Native Zsh, lazy-loading, efficient
- **🌟 Starship prompt** - Blazing fast, highly customizable, cross-shell
- **🛠️ Modern CLI tools** - fzf, zoxide, eza, bat integration
- **🔄 Oh My Zsh compatible** - Use existing OMZ plugins seamlessly
- **💾 Safe migration** - Automatic backups of existing configurations

## 📦 What's Included

### Core Components

| Component                                  | Description                                |
| ------------------------------------------ | ------------------------------------------ |
| [Antidote](https://getantidote.github.io/) | Ultra-fast, native Zsh plugin manager      |
| [Starship](https://starship.rs/)           | Minimal, blazing-fast, customizable prompt |

### Modern CLI Tools

| Tool                                            | Description                                  | Replaces |
| ----------------------------------------------- | -------------------------------------------- | -------- |
| [fzf](https://github.com/junegunn/fzf)          | Fuzzy finder for history, files, directories | -        |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd command with learning             | cd       |
| [eza](https://github.com/eza-community/eza)     | Modern ls with icons and git integration     | ls       |
| [bat](https://github.com/sharkdp/bat)           | Cat clone with syntax highlighting           | cat      |

### Pre-configured Plugins

**Essential:**

- `zsh-autosuggestions` - Fish-like autosuggestions
- `zsh-syntax-highlighting` - Real-time syntax highlighting
- `zsh-completions` - Additional completion definitions
- `zsh-history-substring-search` - History search with ↑/↓
- `fzf-tab` - fzf-powered tab completion

**Oh My Zsh Plugins:**

- git, docker, docker-compose, kubectl
- aws, golang, node, npm, python, pip, vscode

## 🎯 Quick Start

### Prerequisites

- macOS with [Homebrew](https://brew.sh/) installed
- Zsh shell (default on macOS)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/antidote-setup.git
cd antidote-setup

# Run the installer
bash install-antidote.sh

# Restart your shell
exec zsh
```

### Font Setup (Required for Icons)

Starship uses Nerd Font symbols. Install a Nerd Font for best experience:

```bash
# Quick install (recommended)
bash install-nerd-fonts.sh

# Or manual install
brew install --cask font-jetbrains-mono-nerd-font
```

Then configure your terminal to use the installed Nerd Font.

> 📖 See [FONT-GUIDE.md](FONT-GUIDE.md) for detailed font configuration instructions.

## 📂 Repository Structure

```
antidote-setup/
├── install-antidote.sh      # Main installation script
├── install-nerd-fonts.sh    # Nerd Font installer with menu
├── starship.toml            # Custom Starship configuration (Neon Developer theme)
├── README.md                # This file
├── CHEATSHEET.md            # Quick reference guide
├── FONT-GUIDE.md            # Comprehensive font setup guide
└── FONT-QUICKSTART.md       # Quick font installation commands
```

## 🔧 Generated Configuration Files

The installer creates these files in your home directory:

| File                      | Purpose                                                      |
| ------------------------- | ------------------------------------------------------------ |
| `~/.zshrc`                | Main Zsh configuration with aliases, functions, and settings |
| `~/.zsh_plugins.txt`      | Plugin list for Antidote                                     |
| `~/.config/starship.toml` | Starship prompt configuration                                |

## ⚡ Usage

### Essential Commands

```bash
reload              # Reload .zshrc configuration
zshconfig           # Edit .zshrc in your editor
pluginconfig        # Edit plugin list
antidote update     # Update all plugins
```

### Modern Tool Shortcuts

```bash
# Zoxide - Smart directory navigation
z <partial-path>    # Jump to frequently visited directory
zi                  # Interactive directory selection

# FZF - Fuzzy finding
Ctrl+R              # Search command history
Ctrl+T              # Search files
Alt+C               # Search directories

# Eza - Enhanced file listing
ls                  # List with icons
ll                  # Long format with details
lt                  # Tree view (2 levels)
```

### Git Aliases

```bash
gs    # git status
ga    # git add
gc    # git commit
gp    # git push
gl    # git log --oneline --graph --decorate
```

### Docker Aliases

```bash
dps   # docker ps
dpa   # docker ps -a
di    # docker images
dc    # docker-compose
```

### Utility Functions

```bash
mkcd <dir>          # Create directory and cd into it
extract <archive>   # Extract any archive format
server [port]       # Start Python HTTP server (default: 8000)
```

## 🎨 Customization

### Adding Plugins

Edit `~/.zsh_plugins.txt`:

```bash
# GitHub repository
username/repository

# Oh My Zsh plugin
ohmyzsh/ohmyzsh path:plugins/plugin-name

# Local file
/path/to/local/plugin.zsh
```

Then reload: `reload`

### Customizing Starship

This repo includes a custom **Neon Developer** theme in `starship.toml`. To use it:

```bash
# Copy the included theme
cp starship.toml ~/.config/starship.toml
```

Or try Starship presets:

```bash
starship preset nerd-font-symbols -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml
```

> 🎨 All presets: https://starship.rs/presets/

### Adding Custom Aliases

Add to the "Personal Additions" section at the end of `~/.zshrc`:

```bash
alias myalias='my-command'
```

## 🐛 Troubleshooting

### Plugins Not Loading

```bash
rm -f ~/.zsh_plugins.zsh
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
exec zsh
```

### Icons Not Displaying

- Ensure a Nerd Font is installed
- Configure your terminal to use the Nerd Font
- See [FONT-GUIDE.md](FONT-GUIDE.md) for detailed instructions

### Slow Startup

```bash
# Measure startup time
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

# Reduce plugins in ~/.zsh_plugins.txt
```

### Completion Issues

```bash
rm -f ~/.zcompdump*
exec zsh
```

### Restore Previous Configuration

```bash
# List backups
ls -la ~/.zshrc.backup.*

# Restore specific backup
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
exec zsh
```

## 📊 Performance Comparison

| Metric         | Oh My Zsh  | Antidote          |
| -------------- | ---------- | ----------------- |
| Startup Time   | 500-1000ms | 50-150ms          |
| Memory Usage   | ~40-50MB   | ~15-20MB          |
| Plugin Support | ✅         | ✅ (same plugins) |

**Result: ~80% faster startup, ~60% less memory**

## 📚 Documentation

- [CHEATSHEET.md](CHEATSHEET.md) - Quick reference for commands and shortcuts
- [FONT-GUIDE.md](FONT-GUIDE.md) - Comprehensive Nerd Font installation and configuration
- [FONT-QUICKSTART.md](FONT-QUICKSTART.md) - Quick font installation commands

## 🔗 Resources

- [Antidote Documentation](https://getantidote.github.io/)
- [Starship Documentation](https://starship.rs/)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [iTerm2 Color Schemes](https://iterm2colorschemes.com/)

## 🔒 Safety

The installation script:

- ✅ Creates timestamped backups of existing `.zshrc` and `.oh-my-zsh`
- ✅ Does not delete any existing files
- ✅ Uses `set -e` to exit on any error
- ✅ Only modifies user home directory files

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report issues
- Suggest new plugins or configurations
- Submit pull requests

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

**Happy hacking! 🚀**

_Made with ❤️ for developers who value speed and efficiency_
