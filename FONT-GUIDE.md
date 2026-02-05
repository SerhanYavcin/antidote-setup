# 🎨 Nerd Font Kurulum ve Yapılandırma Rehberi

## Neden Nerd Font?

Starship ve modern terminal araçları özel semboller kullanır:
- 📁 Klasör ikonları
-  Git branch
-  Docker
-  Node.js versiyonu
-  Python, Go, Rust ikonları

**Normal font:** ❌ Bozuk kutucuklar görürsün
**Nerd Font:** ✅ Güzel ikonlar görürsün

---

## 🚀 Hızlı Kurulum

```bash
# Scripti çalıştır
bash install-nerd-fonts.sh

# Font seç ve kur
# Terminal ayarlarını yap (aşağıda detaylı)
```

---

## 📦 Önerilen Fontlar

### 1. **JetBrainsMono Nerd Font** ⭐ (En Çok Önerilen)
```bash
brew install --cask font-jetbrains-mono-nerd-font
```
**Neden?**
- Özel olarak kodlama için tasarlandı
- Mükemmel okunabilirlik
- 0, O, l, 1 gibi karakterler net ayrılır
- JetBrains IDE'lerinde varsayılan

**Kimler için:** Herkes, özellikle full-time developer'lar

---

### 2. **FiraCode Nerd Font** (Ligature Sevenlere)
```bash
brew install --cask font-fira-code-nerd-font
```
**Neden?**
- Programming ligatures (!=, =>, >=, <=)
- Modern ve temiz
- VS Code kullanıcıları arasında popüler

**Kimler için:** Ligature seven developer'lar

---

### 3. **Hack Nerd Font** (Minimal Sevenler)
```bash
brew install --cask font-hack-nerd-font
```
**Neden?**
- Açık kaynak
- Clean ve minimal
- Hafif

**Kimler için:** Minimalist developer'lar

---

### 4. **MesloLG Nerd Font** (Powerline Klasiği)
```bash
brew install --cask font-meslo-lg-nerd-font
```
**Neden?**
- Powerline prompt'lar için optimize
- Geniş karakter desteği

**Kimler için:** Oh My Zsh'den geçenler

---

### 5. **CaskaydiaCove Nerd Font** (Microsoft)
```bash
brew install --cask font-caskaydia-cove-nerd-font
```
**Neden?**
- Microsoft'un Cascadia Code'u
- Modern ve profesyonel
- Windows Terminal varsayılanı

**Kimler için:** Windows ile çalışanlar

---

## 🔧 Terminal Yapılandırması

### macOS Terminal.app

1. **Terminal'i aç**
2. **Terminal → Preferences** (⌘,)
3. **Profiles → Text** sekmesi
4. **Font → Change** butonuna tıkla
5. **Family:** "JetBrainsMono Nerd Font" seç
   - **Typeface:** Regular veya Medium
   - **Size:** 13 veya 14
6. **OK** → Profili **Default** yap

**Terminal'i yeniden başlat**

---

### iTerm2 (Önerilen) 🌟

#### Kurulum
```bash
brew install --cask iterm2
```

#### Yapılandırma

1. **iTerm2 → Preferences** (⌘,)

2. **Profiles → Text** sekmesi:
   - **Font:** JetBrainsMono Nerd Font
   - **Size:** 13-14
   - **Use ligatures:** ✓ (FiraCode için)
   - **Anti-aliased:** ✓

3. **Profiles → Colors** sekmesi (Opsiyonel):
   - **Color Presets:** Import
   - Önerilen temalar:
     - Gruvbox Dark
     - Nord
     - Dracula
     - Tomorrow Night

4. **Profiles → Window** sekmesi:
   - **Transparency:** 10-15%
   - **Blur:** 15-20

5. **Profiles → Terminal** sekmesi:
   - **Scrollback lines:** 10000

6. **Default profile olarak ayarla**

#### iTerm2 Color Schemes

```bash
# Gruvbox indirmek için
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors -o ~/Downloads/Gruvbox.itermcolors

# iTerm2'de: Profiles → Colors → Color Presets → Import
# ~/Downloads/Gruvbox.itermcolors dosyasını seç
```

**Popüler temalar:** https://iterm2colorschemes.com/

---

### VS Code Entegre Terminal

1. **VS Code'u aç**
2. **Settings** (⌘,)
3. **Ara:** `terminal font`
4. **Terminal › Integrated: Font Family** bulun
5. Değer olarak ekle:
   ```
   'JetBrainsMono Nerd Font', 'FiraCode Nerd Font', monospace
   ```
6. **Font Size:** 13 (Terminal › Integrated: Font Size)

**Ligature için (FiraCode):**
7. **Ara:** `editor.fontLigatures`
8. ✓ işaretle

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

**Ayarlar:**
1. Settings → Appearance → Text
2. **Font:** JetBrainsMono Nerd Font
3. **Size:** 13

Warp varsayılan olarak güzel, ekstra ayar gerekmez!

---

## ✅ Font Test

Terminal'de şunu çalıştır:

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

**Görmen gerekenler:**
- ✅ Renkli ikonlar
- ✅ Git branch sembolü
- ✅ Dil/araç ikonları

**Göremiyorsan:**
- ❌ Bozuk kutucuklar (□)
- ❌ Soru işaretleri (?)

→ Font doğru yüklenmemiş veya terminal'de seçilmemiş

---

## 🎨 Starship ile Test

```bash
# Herhangi bir git repo'suna git
cd ~/your-project

# Starship prompt'u göreceksin
# Şunları görmeli:
#  - Klasör ikonu
#  - Git branch ikonu
#  - Dil versiyonları (varsa)
```

**Örnek görünüm:**
```
╭─  ~/projects/my-app  main 
╰─➜
```

---

## 🔧 Troubleshooting

### İkonlar görünmüyor

**1. Font doğru mu?**
```bash
# Terminal'de font ismini kontrol et
# macOS Terminal: Preferences → Profiles → Text
# iTerm2: Preferences → Profiles → Text
```

**2. Nerd Font kurulu mu?**
```bash
# Font Book.app'i aç (macOS)
# "Nerd Font" ara
# Kurulu olmalı
```

**3. Terminal'i yeniden başlat**
```bash
# Tamamen kapat ve tekrar aç
# Ayarlar bazen restart gerektirir
```

**4. Font cache temizle (macOS)**
```bash
sudo atsutil databases -remove
sudo atsutil server -shutdown
sudo atsutil server -ping
```

### Ligature çalışmıyor (FiraCode)

**iTerm2:**
- Preferences → Profiles → Text
- "Use ligatures" ✓

**VS Code:**
```json
"editor.fontLigatures": true
```

### Bazı karakterler hala bozuk

Birden fazla Nerd Font kur, fallback olsun:

**VS Code settings.json:**
```json
"terminal.integrated.fontFamily": "'JetBrainsMono Nerd Font', 'Hack Nerd Font', monospace"
```

---

## 📚 Font Kaynakları

- **Nerd Fonts:** https://www.nerdfonts.com/
- **Font Previews:** https://www.programmingfonts.org/
- **iTerm2 Color Schemes:** https://iterm2colorschemes.com/
- **Homebrew Fonts:** https://github.com/Homebrew/homebrew-cask-fonts

---

## 💡 Pro Tips

### 1. Font Boyutu
- **13-14pt:** En okunaklı
- **12pt:** Çok küçük
- **15pt+:** Büyük ekranlarda

### 2. Ligature
- FiraCode kullanıyorsan aç
- Diğer fontlarda genelde kapalı

### 3. Birden Fazla Font
```bash
# Hepsini kur, duruma göre değiştir
brew install --cask \
  font-jetbrains-mono-nerd-font \
  font-fira-code-nerd-font \
  font-hack-nerd-font
```

### 4. Editor vs Terminal
- **Editor:** Okumak için optimize (14pt)
- **Terminal:** Bilgi yoğun (13pt)

---

## 🎯 Önerilen Kombinasyonlar

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
Terminal: Warp veya iTerm2
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
