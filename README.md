# 🚀 Antidote Kurulum Rehberi

Modern, hızlı ve performanslı Zsh setup'ı için kapsamlı kurulum scripti.

## 📦 İçerik

Bu kurulum scripti şunları içerir:

### Plugin Manager
- **Antidote** - Ultra-hızlı, native Zsh plugin manager

### Modern CLI Araçları
- **Starship** - Hızlı, özelleştirilebilir prompt
- **fzf** - Fuzzy finder (Ctrl+R ile history search)
- **zoxide** - Akıllı cd (z komutu)
- **bat** - Renkli cat
- **eza** - Modern ls alternatifi

### Zsh Pluginleri
- zsh-autosuggestions - Komut önerileri
- zsh-syntax-highlighting - Syntax renklendirme
- zsh-completions - Gelişmiş completion
- zsh-history-substring-search - History arama
- fzf-tab - Tab completion için fzf
- Oh My Zsh plugin'leri (git, docker, kubectl, vs.)

## 🎯 Kurulum

### Hızlı Kurulum

```bash
# Scripti çalıştır
bash install-antidote.sh

# Shell'i yeniden başlat
exec zsh
```

### Manuel Adımlar

Eğer adım adım ilerlemek istersen:

#### 1. Homebrew Paketleri

```bash
brew install starship fzf zoxide bat eza
```

#### 2. Antidote

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
```

#### 3. Konfigürasyon

Script otomatik olarak şunları oluşturur:
- `~/.zshrc` - Ana konfigürasyon
- `~/.zsh_plugins.txt` - Plugin listesi
- `~/.config/starship.toml` - Starship prompt ayarları

## 📖 Kullanım

### Temel Komutlar

```bash
# Shell'i yeniden yükle
reload

# Konfigürasyonu düzenle
zshconfig

# Plugin listesini düzenle
pluginconfig

# Plugin'leri güncelle
antidote update
```

### Modern CLI Araçları

```bash
# Zoxide - Akıllı cd
z Documents    # Frequently visited directories
zi             # Interactive selection

# FZF - Fuzzy finder
Ctrl+R         # Command history search
Ctrl+T         # File search
Alt+C          # Directory search

# Eza - Modern ls
ls             # Iconlar ile listing
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

## 🎨 Özelleştirme

### Plugin Ekleme/Çıkarma

1. `~/.zsh_plugins.txt` dosyasını aç:
```bash
vim ~/.zsh_plugins.txt
```

2. Plugin ekle:
```
# GitHub'dan
username/repository

# Oh My Zsh plugin'i
ohmyzsh/ohmyzsh path:plugins/plugin-name

# Local plugin
/path/to/plugin
```

3. Shell'i yeniden yükle:
```bash
reload
```

### Starship Prompt Özelleştirme

```bash
# Config dosyasını aç
vim ~/.config/starship.toml

# Preset'leri dene
starship preset nerd-font-symbols -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
```

Tüm preset'ler: https://starship.rs/presets/

### Alias Ekleme

`~/.zshrc` dosyasının sonuna ekle:

```bash
# Personal Additions bölümüne
alias myalias='my-command'
```

## 🔧 Troubleshooting

### Plugin Yüklenmiyor

```bash
# Plugin cache'i temizle
rm -f ~/.zsh_plugins.zsh

# Yeniden oluştur
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh

# Shell'i yeniden başlat
exec zsh
```

### Starship Görünmüyor

```bash
# Starship kurulu mu kontrol et
which starship

# Kurulu değilse
brew install starship

# Font gerekli (Nerd Font)
# https://www.nerdfonts.com/
```

###느린 Başlangıç

```bash
# Zsh startup zamanını ölç
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

# Plugin sayısını azalt
vim ~/.zsh_plugins.txt
```

### Completion Çalışmıyor

```bash
# Completion cache'i sil
rm -f ~/.zcompdump*

# Shell'i yeniden başlat
exec zsh
```

## 📊 Performans Karşılaştırması

### Oh My Zsh (Önceki)
```
Startup time: ~500-1000ms
Plugins: 10-20
Memory: ~40-50MB
```

### Antidote (Şimdi)
```
Startup time: ~50-150ms
Plugins: 10-20 (aynı)
Memory: ~15-20MB
```

**~80% daha hızlı! ⚡**

## 🔄 Oh My Zsh'den Geçiş

Script otomatik olarak:
- ✅ Mevcut `.zshrc`'yi backup alır
- ✅ Oh My Zsh plugin'lerini kullanmaya devam eder
- ✅ Tüm alias'ları korur
- ❌ Oh My Zsh'yi **silmez** (backup'ta kalır)

### Manuel Geçiş İpuçları

1. Oh My Zsh plugin'lerini Antidote formatına çevir:

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

2. Theme'ler artık Starship kullanıyor:
```bash
# Eski: ZSH_THEME="agnoster"
# Yeni: Starship preset'leri kullan
```

## 🌟 Önerilen Ek Plugin'ler

### Development
```
# ~/.zsh_plugins.txt'ye ekle
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

## 📚 Kaynaklar

- [Antidote Dokümantasyon](https://getantidote.github.io/)
- [Starship Dokümantasyon](https://starship.rs/)
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Zsh Best Practices](https://wiki.archlinux.org/title/Zsh)

## 🆘 Destek

Sorun mu yaşıyorsun?

1. Backup'ları kontrol et:
```bash
ls -la ~/.zshrc.backup.*
ls -la ~/.oh-my-zsh.backup.*
```

2. Eski config'e dön:
```bash
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
exec zsh
```

3. Sıfırdan başla:
```bash
rm -rf ~/.antidote ~/.zsh_plugins*
bash install-antidote.sh
```

## 🎓 Öğrenme Kaynakları

### Zsh Shortcuts
```
Ctrl+A    # Satır başına
Ctrl+E    # Satır sonuna
Ctrl+U    # Satırı sil
Ctrl+K    # Sonuna kadar sil
Ctrl+W    # Kelime sil
Ctrl+R    # History search (fzf)
Ctrl+L    # Clear screen
```

### Directory Navigation
```
cd -      # Önceki dizine dön
cd ~      # Home'a git
cd ..     # Üst dizin
..        # cd .. (alias)
...       # cd ../.. (alias)
z docs    # Zoxide ile hızlı git
```

## ✨ Pro Tips

1. **Tab Completion Kullan**: Her şey için tab'a bas
2. **History Search**: `Ctrl+R` ile geçmişte ara
3. **Zoxide Öğren**: Sık kullandığın dizinlere `z` ile git
4. **Alias Yarat**: Sık kullandığın komutlar için
5. **Git Prompt**: Branch ve status bilgisini prompt'ta gör

## 🔒 Güvenlik

Script şunları yapar:
- ✅ Tüm mevcut dosyaları backup alır
- ✅ Hiçbir şeyi silmez
- ✅ Hata durumunda çıkar (set -e)
- ✅ Sadece kullanıcı dizininde çalışır

## 📝 Changelog

### v1.0.0
- İlk release
- Antidote + Starship entegrasyonu
- Modern CLI araçları
- Kapsamlı plugin koleksiyonu

---

**Happy hacking! 🚀**

Made with ❤️ for software developers
