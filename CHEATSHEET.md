# 🎯 Antidote Quick Reference

## 🚀 Post-Installation First Steps

```bash
# 1. Run the script
bash install-antidote.sh

# 2. Restart the shell
exec zsh

# OR close and reopen the terminal
```

## ⚡ Frequently Used Commands

### System Management
```bash
reload              # Reload .zshrc
zshconfig           # Edit .zshrc
pluginconfig        # Edit plugin list
antidote update     # Update all plugins
```

### Modern CLI Tools
```bash
# Zoxide (Smart CD)
z documents         # Go to frequent directory
zi                  # Interactive selection

# FZF (Fuzzy Finder)
Ctrl+R             # Search command history
Ctrl+T             # Search files
Alt+C              # Search directories

# Eza (Modern ls)
ls                 # List with icons
ll                 # Detailed list
lt                 # Tree view
```

### Git (Shortcuts)
```bash
gs                 # git status
ga .               # git add .
gc -m "msg"        # git commit
gp                 # git push
gl                 # git log (fancy)
```

### Docker
```bash
dps                # docker ps
dpa                # docker ps -a
di                 # docker images
dc up -d           # docker-compose up
```

## 🔧 Plugin Management

### Adding Plugins

1. Open `~/.zsh_plugins.txt`
2. Add plugin:
```
# GitHub repo
username/repository

# Oh My Zsh plugin
ohmyzsh/ohmyzsh path:plugins/plugin-name

# Local plugin
/path/to/plugin
```
3. Run `reload` command

### Popular Plugins

**Developer Tools:**
```
ohmyzsh/ohmyzsh path:plugins/git
ohmyzsh/ohmyzsh path:plugins/docker
ohmyzsh/ohmyzsh path:plugins/kubectl
ohmyzsh/ohmyzsh path:plugins/golang
ohmyzsh/ohmyzsh path:plugins/node
ohmyzsh/ohmyzsh path:plugins/python
```

**Productivity:**
```
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
Aloxaf/fzf-tab
```

## 🎨 Starship Prompt Customization

```bash
# Edit config file
vim ~/.config/starship.toml

# Try ready-made presets
starship preset nerd-font-symbols -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml
```

**All presets:** https://starship.rs/presets/

## 🐛 Troubleshooting

### Plugin Not Working
```bash
rm -f ~/.zsh_plugins.zsh
reload
```

### Slow Startup
```bash
# Measure startup time
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

# Remove unnecessary plugins
vim ~/.zsh_plugins.txt
```

### Completion Issues
```bash
rm -f ~/.zcompdump*
exec zsh
```

### Revert to Previous State
```bash
# Check backup
ls -la ~/.zshrc.backup.*

# Restore
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
exec zsh
```

## ⌨️ Keyboard Shortcuts

### Navigation
```
Ctrl+A             # Beginning of line
Ctrl+E             # End of line
Ctrl+U             # Delete line
Ctrl+K             # Delete to end
Ctrl+W             # Delete word
```

### History
```
Ctrl+R             # Search history (FZF)
↑ / ↓              # History navigation
!!                 # Repeat last command
!$                 # Use last argument
```

### Directory
```
cd -               # Go to previous directory
..                 # Go up one directory
...                # Go up two directories
....               # Go up three directories
```

## 📁 Important Files

```
~/.zshrc                      # Main configuration
~/.zsh_plugins.txt            # Plugin list
~/.zsh_plugins.zsh            # Generated plugins (do not touch!)
~/.config/starship.toml       # Starship prompt config
~/.antidote/                  # Antidote installation
~/.zsh_history                # Command history
```

## 🔥 Pro Tips

1. **Tab Completion**: Press tab everywhere
   ```bash
   git che<TAB>     # Completes: checkout
   docker ps<TAB>   # Container options
   ```

2. **History Search**: Partial command + ↑/↓
   ```bash
   git <↑>          # Commands starting with git
   ```

3. **Zoxide Magic**: Just directory name is enough
   ```bash
   z proj           # ~/projects/my-project
   ```

4. **FZF Preview**: Search command with Ctrl+R, preview
   
5. **Alias Chaining**: Create your own workflow
   ```bash
   alias gpl='git pull && git log --oneline -5'
   ```

## 🎓 Learning Path

### Day 1: Basic Usage
- Learn `reload`, `zshconfig` commands
- Try Git shortcuts (gs, ga, gc)
- Discover history search with FZF (Ctrl+R)

### Day 2: Modern Tools
- Start using Zoxide (z command)
- List files with Eza (ll, lt)
- Discover tab completion

### Day 3: Customization
- Add your own aliases
- Edit plugin list
- Customize Starship prompt

### Week 1: Pro Level
- Write custom functions
- Memorize keyboard shortcuts
- Optimize your workflow

## 📊 Performance Metrics

**Oh My Zsh → Antidote:**
```
Startup: 500ms → 50ms   (10x faster)
Memory:  40MB → 15MB     (62% reduction)
Plugins: 20 → 20         (same features)
```

## 🆘 Get Help

**Issue?**

1. Check README.md file
2. Use backups
3. Install from scratch

**More info:**
- Antidote: https://getantidote.github.io/
- Starship: https://starship.rs/
- Awesome Zsh: https://github.com/unixorn/awesome-zsh-plugins

---

**Happy coding! 🚀**
