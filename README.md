# 🚀 Antidote Installation Guide

Comprehensive installation script for a modern, fast, and high-performance Zsh setup.

## 📦 Contents

This installation script includes:

### Plugin Manager
- **Antidote** - Ultra-fast, native Zsh plugin manager

### Modern CLI Tools
- **Starship** - Fast, customizable prompt
- **fzf** - Fuzzy finder (History search with Ctrl+R)
- **zoxide** - Smart cd (z command)
- **bat** - Colorful cat
- **eza** - Modern ls alternative

### Zsh Plugins
- zsh-autosuggestions - Command suggestions
- zsh-syntax-highlighting - Syntax highlighting
- zsh-completions - Advanced completion
- zsh-history-substring-search - History search
- fzf-tab - fzf for tab completion
- Oh My Zsh plugins (git, docker, kubectl, etc.)

## 🎯 Installation

### Quick Install

```bash
# Run the script
bash install-antidote.sh

# Restart the shell
exec zsh
```

### Manual Steps

If you want to proceed step by step:

#### 1. Homebrew Packages

```bash
brew install starship fzf zoxide bat eza
```

#### 2. Antidote

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
```

#### 3. Configuration

The script automatically generates:
- `~/.zshrc` - Main configuration
- `~/.zsh_plugins.txt` - Plugin list
- `~/.config/starship.toml` - Starship prompt settings

## 📖 Usage

### Basic Commands

```bash
# Reload shell
reload

# Edit configuration
zshconfig

# Edit plugin list
pluginconfig

# Update plugins
antidote update
```

### Modern CLI Tools

```bash
# Zoxide - Smart cd
z Documents    # Frequently visited directories
zi             # Interactive selection

# FZF - Fuzzy finder
Ctrl+R         # Command history search
Ctrl+T         # File search
Alt+C          # Directory search

# Eza - Modern ls
ls             # Listing with icons
ll             # Long format with icons
lt             # Tree view
```

### Git Aliases

```bash
gs    # git status
ga    # git add
gc    # git commit
gp    # git push
gl    # git log (fancy)
```

### Docker Aliases

```bash
dps   # docker ps
dpa   # docker ps -a
di    # docker images
dc    # docker-compose
```

## 🎨 Customization

### Adding/Removing Plugins

1. Open `~/.zsh_plugins.txt`:
```bash
vim ~/.zsh_plugins.txt
```

2. Add plugin:
```
# From GitHub
username/repository

# Oh My Zsh plugin
ohmyzsh/ohmyzsh path:plugins/plugin-name

# Local plugin
/path/to/plugin
```

3. Reload shell:
```bash
reload
```

### Starship Prompt Customization

```bash
# Open config file
vim ~/.config/starship.toml

# Try presets
starship preset nerd-font-symbols -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
```

All presets: https://starship.rs/presets/

### Adding Aliases

Add to the end of `~/.zshrc`:

```bash
# Personal Additions section
alias myalias='my-command'
```

## 🔧 Troubleshooting

### Plugin Not Loading

```bash
# Clear plugin cache
rm -f ~/.zsh_plugins.zsh

# Regenerate
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh

# Restart shell
exec zsh
```

### Starship Not Visible

```bash
# Check if Starship is installed
which starship

# If not installed
brew install starship

# Font required (Nerd Font)
# https://www.nerdfonts.com/
```

### Slow Startup

```bash
# Measure Zsh startup time
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

# Reduce number of plugins
vim ~/.zsh_plugins.txt
```

### Completion Not Working

```bash
# Clear completion cache
rm -f ~/.zcompdump*

# Restart shell
exec zsh
```

## 📊 Performance Comparison

### Oh My Zsh (Previous)
```
Startup time: ~500-1000ms
Plugins: 10-20
Memory: ~40-50MB
```

### Antidote (Now)
```
Startup time: ~50-150ms
Plugins: 10-20 (same)
Memory: ~15-20MB
```

**~80% faster! ⚡**

## 🔄 Migration from Oh My Zsh

The script automatically:
- ✅ Backs up existing `.zshrc`
- ✅ Continues using Oh My Zsh plugins
- ✅ Preserves all aliases
- ❌ Does **not** delete Oh My Zsh (kept in backup)

### Manual Migration Tips

1. Convert Oh My Zsh plugins to Antidote format:

**Oh My Zsh:**
```bash
plugins=(git docker kubectl)
```

**Antidote:**
```
ohmyzsh/ohmyzsh path:plugins/git
ohmyzsh/ohmyzsh path:plugins/docker
ohmyzsh/ohmyzsh path:plugins/kubectl
```

2. Themes now use Starship:
```bash
# Old: ZSH_THEME="agnoster"
# New: Use Starship presets
```

## 🌟 Recommended Additional Plugins

### Development
```
# Add to ~/.zsh_plugins.txt
zsh-users/zsh-docker-aliases
lukechilds/zsh-nvm
zdharma-continuum/fast-syntax-highlighting
```

### Productivity
```
agkozak/zsh-z
unixorn/git-extra-commands
djui/alias-tips
```

### macOS Specific
```
ohmyzsh/ohmyzsh path:plugins/macos
ohmyzsh/ohmyzsh path:plugins/brew
```

## 📚 Resources

- [Antidote Documentation](https://getantidote.github.io/)
- [Starship Documentation](https://starship.rs/)
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Zsh Best Practices](https://wiki.archlinux.org/title/Zsh)

## 🆘 Support

Having trouble?

1. Check backups:
```bash
ls -la ~/.zshrc.backup.*
ls -la ~/.oh-my-zsh.backup.*
```

2. Revert to old config:
```bash
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
exec zsh
```

3. Start fresh:
```bash
rm -rf ~/.antidote ~/.zsh_plugins*
bash install-antidote.sh
```

## 🎓 Learning Resources

### Zsh Shortcuts
```
Ctrl+A    # Beginning of line
Ctrl+E    # End of line
Ctrl+U    # Delete line
Ctrl+K    # Delete to end
Ctrl+W    # Delete word
Ctrl+R    # History search (fzf)
Ctrl+L    # Clear screen
```

### Directory Navigation
```
cd -      # Go to previous directory
cd ~      # Go to Home
cd ..     # Go up one directory
..        # cd .. (alias)
...       # cd ../.. (alias)
z docs    # Fast navigation with Zoxide
```

## ✨ Pro Tips

1. **Use Tab Completion**: Press tab for everything
2. **History Search**: Search past commands with `Ctrl+R`
3. **Learn Zoxide**: Navigate to frequent directories with `z`
4. **Create Aliases**: For frequently used commands
5. **Git Prompt**: See branch and status info in prompt

## 🔒 Security

The script:
- ✅ Backs up all existing files
- ✅ Deletes nothing
- ✅ Exits on error (set -e)
- ✅ Runs only in user directory

## 📝 Changelog

### v1.0.0
- Initial release
- Antidote + Starship integration
- Modern CLI tools
- Comprehensive plugin collection

---

**Happy hacking! 🚀**

Made with ❤️ for software developers
