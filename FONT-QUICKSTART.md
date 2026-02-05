# ⚡ Quick Font Installation Commands

## 🎯 Single Command Installation

### Most Popular: JetBrainsMono (Recommended)
```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Other Options

**FiraCode (Ligature):**
```bash
brew install --cask font-fira-code-nerd-font
```

**Hack (Minimal):**
```bash
brew install --cask font-hack-nerd-font
```

**MesloLG (Powerline):**
```bash
brew install --cask font-meslo-lg-nerd-font
```

**CaskaydiaCove (Microsoft):**
```bash
brew install --cask font-caskaydia-cove-nerd-font
```

### Install All
```bash
brew tap homebrew/cask-fonts
brew install --cask \
  font-jetbrains-mono-nerd-font \
  font-fira-code-nerd-font \
  font-hack-nerd-font \
  font-meslo-lg-nerd-font \
  font-caskaydia-cove-nerd-font
```

---

## 🔧 Terminal Settings (Quick)

### macOS Terminal
```
Terminal → Preferences (⌘,)
Profiles → Text → Font → Change
→ "JetBrainsMono Nerd Font" → Size: 13
→ Set as Default
```

### iTerm2 (Recommended)
```bash
# Install first
brew install --cask iterm2

# Then configure
iTerm2 → Preferences (⌘,)
Profiles → Text
→ Font: "JetBrainsMono Nerd Font"
→ Size: 13
→ Use ligatures: ✓ (For FiraCode)
```

### VS Code Terminal
```json
{
  "terminal.integrated.fontFamily": "'JetBrainsMono Nerd Font'",
  "terminal.integrated.fontSize": 13
}
```

---

## ✅ Test

In Terminal:
```bash
echo "      "
```

If you see icons ✅ done!
If you see boxes ❌ font is not set.

---

## 🎨 Bonus: iTerm2 Theme

**Gruvbox Dark (Recommended):**
```bash
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

# In iTerm2:
# Profiles → Colors → Color Presets → Import
# Select Gruvbox.itermcolors file
```

**Nord:**
```bash
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Nord.itermcolors -o ~/Downloads/Nord.itermcolors
```

**Dracula:**
```bash
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula.itermcolors -o ~/Downloads/Dracula.itermcolors
```

---

## 🚀 Full Setup (One Shot)

```bash
# Font + Terminal + Theme
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font iterm2

# Download Gruvbox theme
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

echo "✅ Installation complete!"
echo ""
echo "Now:"
echo "1. Open iTerm2"
echo "2. ⌘, → Profiles → Text → Font: JetBrainsMono Nerd Font (13pt)"
echo "3. ⌘, → Profiles → Colors → Color Presets → Import → Gruvbox.itermcolors"
echo "4. Close and reopen Terminal"
```

---

**More detailed info:** Check FONT-GUIDE.md file!
