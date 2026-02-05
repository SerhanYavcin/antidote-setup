# 🎯 Antidote Hızlı Referans

## 🚀 Kurulum Sonrası İlk Adımlar

```bash
# 1. Scripti çalıştır
bash install-antidote.sh

# 2. Shell'i yeniden başlat
exec zsh

# VEYA terminal'i kapat ve tekrar aç
```

## ⚡ Sık Kullanılan Komutlar

### Sistem Yönetimi
```bash
reload              # .zshrc'yi yeniden yükle
zshconfig           # .zshrc'yi düzenle
pluginconfig        # Plugin listesini düzenle
antidote update     # Tüm pluginleri güncelle
```

### Modern CLI Araçları
```bash
# Zoxide (Akıllı CD)
z documents         # Sık kullanılan dizine git
zi                  # İnteraktif seçim

# FZF (Fuzzy Finder)
Ctrl+R             # Komut geçmişinde ara
Ctrl+T             # Dosya ara
Alt+C              # Dizin ara

# Eza (Modern ls)
ls                 # İkonlarla liste
ll                 # Detaylı liste
lt                 # Ağaç görünümü
```

### Git (Kısayollar)
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

## 🔧 Plugin Yönetimi

### Plugin Ekleme

1. `~/.zsh_plugins.txt` dosyasını aç
2. Plugin ekle:
```
# GitHub repo
username/repository

# Oh My Zsh plugin
ohmyzsh/ohmyzsh path:plugins/plugin-name

# Local plugin
/path/to/plugin
```
3. `reload` komutunu çalıştır

### Popüler Pluginler

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

## 🎨 Starship Prompt Özelleştirme

```bash
# Config dosyasını düzenle
vim ~/.config/starship.toml

# Hazır presetleri dene
starship preset nerd-font-symbols -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml
```

**Tüm presetler:** https://starship.rs/presets/

## 🐛 Sorun Giderme

### Plugin Çalışmıyor
```bash
rm -f ~/.zsh_plugins.zsh
reload
```

### Yavaş Açılış
```bash
# Startup zamanını ölç
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

# Gereksiz pluginleri kaldır
vim ~/.zsh_plugins.txt
```

### Completion Sorunları
```bash
rm -f ~/.zcompdump*
exec zsh
```

### Eski Haline Dön
```bash
# Backup'ı kontrol et
ls -la ~/.zshrc.backup.*

# Geri yükle
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
exec zsh
```

## ⌨️ Klavye Kısayolları

### Navigation
```
Ctrl+A             # Satır başı
Ctrl+E             # Satır sonu
Ctrl+U             # Satırı sil
Ctrl+K             # Sonuna kadar sil
Ctrl+W             # Kelime sil
```

### History
```
Ctrl+R             # History'de ara (FZF)
↑ / ↓              # History navigation
!!                 # Son komutu tekrarla
!$                 # Son argümanı kullan
```

### Directory
```
cd -               # Önceki dizine dön
..                 # Üst dizin
...                # İki üst dizin
....               # Üç üst dizin
```

## 📁 Önemli Dosyalar

```
~/.zshrc                      # Ana konfigürasyon
~/.zsh_plugins.txt            # Plugin listesi
~/.zsh_plugins.zsh            # Generated plugins (dokunma!)
~/.config/starship.toml       # Starship prompt config
~/.antidote/                  # Antidote kurulumu
~/.zsh_history                # Komut geçmişi
```

## 🔥 Pro Tips

1. **Tab Completion**: Her yerde tab'a bas
   ```bash
   git che<TAB>     # Tamamlar: checkout
   docker ps<TAB>   # Container seçenekleri
   ```

2. **History Search**: Kısmi komut + ↑/↓
   ```bash
   git <↑>          # git ile başlayan komutlar
   ```

3. **Zoxide Magic**: Sadece dizin adı yeter
   ```bash
   z proj           # ~/projects/my-project
   ```

4. **FZF Preview**: Ctrl+R ile komut ara, önizle
   
5. **Alias Zincirleme**: Kendi workflow'unu yarat
   ```bash
   alias gpl='git pull && git log --oneline -5'
   ```

## 🎓 Öğrenme Yolu

### Gün 1: Temel Kullanım
- `reload`, `zshconfig` komutlarını öğren
- Git kısayollarını dene (gs, ga, gc)
- FZF ile history aramasını keşfet (Ctrl+R)

### Gün 2: Modern Tools
- Zoxide'i kullanmaya başla (z komutu)
- Eza ile dosya listele (ll, lt)
- Tab completion'ı keşfet

### Gün 3: Özelleştirme
- Kendi alias'larını ekle
- Plugin listesini düzenle
- Starship prompt'u özelleştir

### Hafta 1: Pro Level
- Custom function'lar yaz
- Keyboard shortcut'ları ezbere
- Workflow'unu optimize et

## 📊 Performans Metrikleri

**Oh My Zsh → Antidote:**
```
Startup: 500ms → 50ms   (10x hızlı)
Memory:  40MB → 15MB     (62% azalma)
Plugins: 20 → 20         (aynı özellikler)
```

## 🆘 Yardım Al

**Sorun mu var?**

1. README.md dosyasına bak
2. Backup'ları kullan
3. Sıfırdan kurulum yap

**Daha fazla bilgi:**
- Antidote: https://getantidote.github.io/
- Starship: https://starship.rs/
- Awesome Zsh: https://github.com/unixorn/awesome-zsh-plugins

---

**Keyifli kullanımlar! 🚀**
