# 🎨 Nerd Font Installation and Configuration Guide

## Why Nerd Font?

Starship and modern terminal tools use special symbols:
- 📁 Folder icons
-  Git branch
-  Docker
-  Node.js version
-  Python, Go, Rust icons

**Normal font:** ❌ You see broken boxes
**Nerd Font:** ✅ You see beautiful icons

---

## 🚀 Quick Install

```bash
# Run the script
bash install-nerd-fonts.sh

# Select font and install
# Configure terminal settings (detailed below)
```

---

## 📦 Recommended Fonts

### 1. **JetBrainsMono Nerd Font** ⭐ (Most Recommended)
```bash
brew install --cask font-jetbrains-mono-nerd-font
```
**Why?**
- Designed specifically for coding
- Excellent readability
- Characters like 0, O, l, 1 are clearly distinguished
- Default in JetBrains IDEs

**For whom:** Everyone, especially full-time developers

---

### 2. **FiraCode Nerd Font** (For Ligature Lovers)
```bash
brew install --cask font-fira-code-nerd-font
```
**Why?**
- Programming ligatures (!=, =>, >=, <=)
- Modern and clean
- Popular among VS Code users

**For whom:** Developers who love ligatures

---

### 3. **Hack Nerd Font** (For Minimalists)
```bash
brew install --cask font-hack-nerd-font
```
**Why?**
- Open source
- Clean and minimal
- Lightweight

**For whom:** Minimalist developers

---

### 4. **MesloLG Nerd Font** (Powerline Classic)
```bash
brew install --cask font-meslo-lg-nerd-font
```
**Why?**
- Optimized for Powerline prompts
- Wide character support

**For whom:** Those migrating from Oh My Zsh

---

### 5. **CaskaydiaCove Nerd Font** (Microsoft)
```bash
brew install --cask font-caskaydia-cove-nerd-font
```
**Why?**
- Microsoft's Cascadia Code
- Modern and professional
- Default in Windows Terminal

**For whom:** Those working with Windows

---

## 🔧 Terminal Configuration

### macOS Terminal.app

1. **Open Terminal**
2. **Terminal → Preferences** (⌘,)
3. **Profiles → Text** tab
4. Click **Font → Change** button
5. **Family:** Select "JetBrainsMono Nerd Font"
   - **Typeface:** Regular or Medium
   - **Size:** 13 or 14
6. **OK** → Set profile as **Default**

**Restart Terminal**

---

### iTerm2 (Recommended) 🌟

#### Installation
```bash
brew install --cask iterm2
```

#### Configuration

1. **iTerm2 → Preferences** (⌘,)

2. **Profiles → Text** tab:
   - **Font:** JetBrainsMono Nerd Font
   - **Size:** 13-14
   - **Use ligatures:** ✓ (For FiraCode)
   - **Anti-aliased:** ✓

3. **Profiles → Colors** tab (Optional):
   - **Color Presets:** Import
   - Recommended themes:
     - Gruvbox Dark
     - Nord
     - Dracula
     - Tomorrow Night

4. **Profiles → Window** tab:
   - **Transparency:** 10-15%
   - **Blur:** 15-20

5. **Profiles → Terminal** tab:
   - **Scrollback lines:** 10000

6. **Set as Default profile**

#### iTerm2 Color Schemes

```bash
# To download Gruvbox
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

# In iTerm2: Profiles → Colors → Color Presets → Import
# Select ~/Downloads/Gruvbox.itermcolors file
```

**Popular themes:** https://iterm2colorschemes.com/

---

### VS Code Integrated Terminal

1. **Open VS Code**
2. **Settings** (⌘,)
3. **Search:** `terminal font`
4. Find **Terminal › Integrated: Font Family**
5. Add as value:
   ```
   'JetBrainsMono Nerd Font', 'FiraCode Nerd Font', monospace
   ```
6. **Font Size:** 13 (Terminal › Integrated: Font Size)

**For Ligatures (FiraCode):**
7. **Search:** `editor.fontLigatures`
8. Check ✓

**settings.json:**
```json
{
  "terminal.integrated.fontFamily": "'JetBrainsMono Nerd Font'",
  "terminal.integrated.fontSize": 13,
  "editor.fontFamily": "'JetBrainsMono Nerd Font', 'Fira Code', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 14
}
```

---

### Warp Terminal

```bash
brew install --cask warp
```

**Settings:**
1. Settings → Appearance → Text
2. **Font:** JetBrainsMono Nerd Font
3. **Size:** 13

Warp is beautiful by default, no extra configuration needed!

---

## ✅ Font Test

Run this in Terminal:

```bash
echo "                   "
echo "Testing Nerd Font Icons:"
echo "Directory:  ~/projects"
echo "Git:  main"
echo "Docker:  container"
echo "Node:  v20.0.0"
echo "Python:  3.11"
echo "Rust:  1.75"
```

**What you should see:**
- ✅ Colorful icons
- ✅ Git branch symbol
- ✅ Language/tool icons

**If you don't see them:**
- ❌ Broken boxes (□)
- ❌ Question marks (?)

→ Font is not installed correctly or not selected in terminal

---

## 🎨 Test with Starship

```bash
# Go to any git repo
cd ~/your-project

# You will see Starship prompt
# Should see:
#  - Folder icon
#  - Git branch icon
#  - Language versions (if any)
```

**Example view:**
```
╭─  ~/projects/my-app  main 
╰─➜
```

---

## 🔧 Troubleshooting

### Icons not showing

**1. Is Font correct?**
```bash
# Check font name in Terminal
# macOS Terminal: Preferences → Profiles → Text
# iTerm2: Preferences → Profiles → Text
```

**2. Is Nerd Font installed?**
```bash
# Open Font Book.app (macOS)
# Search "Nerd Font"
# It should be installed
```

**3. Restart Terminal**
```bash
# Completely close and reopen
# Settings sometimes require restart
```

**4. Clear Font cache (macOS)**
```bash
sudo atsutil databases -remove
sudo atsutil server -shutdown
sudo atsutil server -ping
```

### Ligatures not working (FiraCode)

**iTerm2:**
- Preferences → Profiles → Text
- "Use ligatures" ✓

**VS Code:**
```json
"editor.fontLigatures": true
```

### Some characters still broken

Install multiple Nerd Fonts, as fallback:

**VS Code settings.json:**
```json
"terminal.integrated.fontFamily": "'JetBrainsMono Nerd Font', 'Hack Nerd Font', monospace"
```

---

## 📚 Font Resources

- **Nerd Fonts:** https://www.nerdfonts.com/
- **Font Previews:** https://www.programmingfonts.org/
- **iTerm2 Color Schemes:** https://iterm2colorschemes.com/
- **Homebrew Fonts:** https://github.com/Homebrew/homebrew-cask-fonts

---

## 💡 Pro Tips

### 1. Font Size
- **13-14pt:** Most readable
- **12pt:** Too small
- **15pt+:** On large screens

### 2. Ligatures
- Turn on if using FiraCode
- Generally off in other fonts

### 3. Multiple Fonts
```bash
# Install all, switch as needed
brew install --cask \
  font-jetbrains-mono-nerd-font \
  font-fira-code-nerd-font \
  font-hack-nerd-font
```

### 4. Editor vs Terminal
- **Editor:** Optimized for reading (14pt)
- **Terminal:** Information dense (13pt)

---

## 🎯 Recommended Combinations

### Minimalist Developer
```
Font: Hack Nerd Font
Terminal: iTerm2
Theme: Gruvbox Dark
Size: 13pt
```

### Modern Developer
```
Font: JetBrainsMono Nerd Font
Terminal: Warp or iTerm2
Theme: Nord
Size: 14pt
```

### Ligature Lover
```
Font: FiraCode Nerd Font
Terminal: VS Code / iTerm2
Theme: Dracula
Size: 13pt
Ligatures: ON
```

---

**Happy coding! 🚀**
