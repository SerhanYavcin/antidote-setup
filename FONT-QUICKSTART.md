# ⚡ Hızlı Font Kurulum Komutları

## 🎯 Tek Komutla Kurulum

### En Popüler: JetBrainsMono (Önerilen)
```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Diğer Seçenekler

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

### Hepsini Kur
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

## 🔧 Terminal Ayarları (Hızlı)

### macOS Terminal
```
Terminal → Preferences (⌘,)
Profiles → Text → Font → Change
→ "JetBrainsMono Nerd Font" → Size: 13
→ Set as Default
```

### iTerm2 (Önerilen)
```bash
# Önce kur
brew install --cask iterm2

# Sonra ayarla
iTerm2 → Preferences (⌘,)
Profiles → Text
→ Font: "JetBrainsMono Nerd Font"
→ Size: 13
→ Use ligatures: ✓ (FiraCode için)
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

Terminal'de:
```bash
echo "      "
```

İkonları görüyorsan ✅ tamam!
Kutucuklar görüyorsan ❌ font ayarlanmamış.

---

## 🎨 Bonus: iTerm2 Tema

**Gruvbox Dark (Önerilen):**
```bash
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

# iTerm2'de:
# Profiles → Colors → Color Presets → Import
# Gruvbox.itermcolors dosyasını seç
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

## 🚀 Tüm Setup (Tek Seferde)

```bash
# Font + Terminal + Tema
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font iterm2

# Gruvbox tema indir
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

echo "✅ Kurulum tamam!"
echo ""
echo "Şimdi:"
echo "1. iTerm2'yi aç"
echo "2. ⌘, → Profiles → Text → Font: JetBrainsMono Nerd Font (13pt)"
echo "3. ⌘, → Profiles → Colors → Color Presets → Import → Gruvbox.itermcolors"
echo "4. Terminal'i kapat ve tekrar aç"
```

---

**Daha detaylı bilgi:** FONT-GUIDE.md dosyasına bak!
