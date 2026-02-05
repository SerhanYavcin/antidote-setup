#!/bin/bash

# Nerd Font Installer for macOS
# ==============================

set -e

echo "🎨 Nerd Font Kurulum Scripti"
echo "=============================="
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}▶${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${CYAN}ℹ${NC} $1"
}

# Popüler Nerd Font'ları listele
print_info "En popüler Nerd Font'lar:"
echo ""
echo "1. JetBrainsMono Nerd Font    (Önerilen - Kodlama için)"
echo "2. FiraCode Nerd Font         (Ligature desteği)"
echo "3. Hack Nerd Font             (Clean & readable)"
echo "4. MesloLG Nerd Font          (Powerline uyumlu)"
echo "5. CascadiaCode Nerd Font     (Microsoft, modern)"
echo "6. Hepsini kur"
echo ""

read -p "Hangi font'u kurmak istersin? (1-6): " choice

# Font kurulum fonksiyonu
install_font() {
    local font_name=$1
    print_status "$font_name kuruluyor..."
    brew install --cask "font-$font_name"
    print_success "$font_name kuruldu!"
}



# Seçime göre font kur
case $choice in
    1)
        install_font "jetbrains-mono-nerd-font"
        RECOMMENDED_FONT="JetBrainsMono Nerd Font"
        ;;
    2)
        install_font "fira-code-nerd-font"
        RECOMMENDED_FONT="FiraCode Nerd Font"
        ;;
    3)
        install_font "hack-nerd-font"
        RECOMMENDED_FONT="Hack Nerd Font"
        ;;
    4)
        install_font "meslo-lg-nerd-font"
        RECOMMENDED_FONT="MesloLG Nerd Font"
        ;;
    5)
        install_font "caskaydia-cove-nerd-font"
        RECOMMENDED_FONT="CaskaydiaCove Nerd Font"
        ;;
    6)
        print_status "Tüm popüler fontlar kuruluyor..."
        install_font "jetbrains-mono-nerd-font"
        install_font "fira-code-nerd-font"
        install_font "hack-nerd-font"
        install_font "meslo-lg-nerd-font"
        install_font "caskaydia-cove-nerd-font"
        RECOMMENDED_FONT="JetBrainsMono Nerd Font"
        ;;
    *)
        echo "Geçersiz seçim!"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     ✅ Font Kurulumu Tamamlandı!     ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}📝 Terminal Ayarları:${NC}"
echo ""
echo "Şimdi terminal emülatörünü yapılandırman gerekiyor:"
echo ""

# macOS default Terminal.app için talimatlar
echo -e "${YELLOW}■ Terminal.app (macOS varsayılan):${NC}"
echo "  1. Terminal → Preferences (⌘,)"
echo "  2. Profiles → Text sekmesi"
echo "  3. Font → Change"
echo "  4. '${RECOMMENDED_FONT}' seç"
echo "  5. Boyut: 13-14 önerilen"
echo "  6. 'Default' olarak ayarla"
echo ""

# iTerm2 için talimatlar
echo -e "${YELLOW}■ iTerm2 (Önerilen terminal):${NC}"
echo "  1. iTerm2 → Preferences (⌘,)"
echo "  2. Profiles → Text sekmesi"
echo "  3. Font → '${RECOMMENDED_FONT}'"
echo "  4. Size: 13-14"
echo "  5. Use ligatures: ✓ (FiraCode için)"
echo ""

# VS Code için talimatlar
echo -e "${YELLOW}■ VS Code Terminal:${NC}"
echo "  1. Settings (⌘,)"
echo "  2. 'terminal font' ara"
echo "  3. Terminal › Integrated: Font Family"
echo "  4. '${RECOMMENDED_FONT}' yaz"
echo ""

# iTerm2 yoksa kur
if ! command -v iTerm &> /dev/null; then
    echo -e "${CYAN}💡 İpucu:${NC} iTerm2 daha iyi bir terminal deneyimi sunar"
    read -p "iTerm2'yi kurmak ister misin? (y/n): " install_iterm
    if [[ $install_iterm == "y" ]]; then
        print_status "iTerm2 kuruluyor..."
        brew install --cask iterm2
        print_success "iTerm2 kuruldu! Applications klasöründen başlat."
        echo ""
        echo "iTerm2 için önerilen ayarlar:"
        echo "  • Color scheme: 'Gruvbox Dark' veya 'Nord'"
        echo "  • Transparency: %10-15"
        echo "  • Blur: Biraz"
    fi
fi

echo ""
echo -e "${CYAN}🎨 Font Özellikleri:${NC}"
echo ""

case $choice in
    1)
        echo "JetBrainsMono Nerd Font:"
        echo "  ✓ Özel olarak kodlama için tasarlandı"
        echo "  ✓ Mükemmel okunabilirlik"
        echo "  ✓ Geniş karakter desteği"
        echo "  ✓ Tüm dev araçlarıyla uyumlu"
        ;;
    2)
        echo "FiraCode Nerd Font:"
        echo "  ✓ Programming ligatures (!=, =>, >=)"
        echo "  ✓ Modern ve clean"
        echo "  ✓ VS Code'da çok popüler"
        ;;
    3)
        echo "Hack Nerd Font:"
        echo "  ✓ Açık kaynak"
        echo "  ✓ Yüksek okunabilirlik"
        echo "  ✓ Klasik developer font'u"
        ;;
esac

echo ""
echo -e "${CYAN}🔍 Test Et:${NC}"
echo ""
echo "Yeni terminal aç ve şunu çalıştır:"
echo ""
echo -e "${YELLOW}  echo '      '${NC}"
echo ""
echo "İkonları görüyorsan font çalışıyor! ✅"
echo ""

echo -e "${GREEN}Keyifli kullanımlar! 🚀${NC}"
