#!/bin/bash

# Nerd Font Installer for macOS
# ==============================

set -e

echo "🎨 Nerd Font Installation Script"
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

# List popular Nerd Fonts
print_info "Most Popular Nerd Fonts:"
echo ""
echo "1. JetBrainsMono Nerd Font    (Recommended - For Coding)"
echo "2. FiraCode Nerd Font         (Ligature support)"
echo "3. Hack Nerd Font             (Clean & readable)"
echo "4. MesloLG Nerd Font          (Powerline compatible)"
echo "5. CascadiaCode Nerd Font     (Microsoft, modern)"
echo "6. Install All"
echo ""

read -p "Which font would you like to install? (1-6): " choice

# Font installation function
install_font() {
    local font_name=$1
    print_status "Installing $font_name..."
    brew install --cask "font-$font_name"
    print_success "$font_name installed!"
}



# Install font based on choice
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
        print_status "Installing all popular fonts..."
        install_font "jetbrains-mono-nerd-font"
        install_font "fira-code-nerd-font"
        install_font "hack-nerd-font"
        install_font "meslo-lg-nerd-font"
        install_font "caskaydia-cove-nerd-font"
        RECOMMENDED_FONT="JetBrainsMono Nerd Font"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     ✅ Font Installation Complete!   ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}📝 Terminal Settings:${NC}"
echo ""
echo "Now you need to configure your terminal emulator:"
echo ""

# Instructions for macOS default Terminal.app
echo -e "${YELLOW}■ Terminal.app (macOS default):${NC}"
echo "  1. Terminal → Preferences (⌘,)"
echo "  2. Profiles → Text tab"
echo "  3. Font → Change"
echo "  4. Select '${RECOMMENDED_FONT}'"
echo "  5. Size: 13-14 recommended"
echo "  6. Set as 'Default'"
echo ""

# Instructions for iTerm2
echo -e "${YELLOW}■ iTerm2 (Recommended terminal):${NC}"
echo "  1. iTerm2 → Preferences (⌘,)"
echo "  2. Profiles → Text tab"
echo "  3. Font → '${RECOMMENDED_FONT}'"
echo "  4. Size: 13-14"
echo "  5. Use ligatures: ✓ (For FiraCode)"
echo ""

# Instructions for VS Code
echo -e "${YELLOW}■ VS Code Terminal:${NC}"
echo "  1. Settings (⌘,)"
echo "  2. Search 'terminal font'"
echo "  3. Terminal › Integrated: Font Family"
echo "  4. Type '${RECOMMENDED_FONT}'"
echo ""

# Install iTerm2 if not present
if ! command -v iTerm &> /dev/null; then
    echo -e "${CYAN}💡 Tip:${NC} iTerm2 offers a better terminal experience"
    read -p "Do you want to install iTerm2? (y/n): " install_iterm
    if [[ $install_iterm == "y" ]]; then
        print_status "Installing iTerm2..."
        brew install --cask iterm2
        print_success "iTerm2 installed! Launch from Applications folder."
        echo ""
        echo "Recommended settings for iTerm2:"
        echo "  • Color scheme: 'Gruvbox Dark' or 'Nord'"
        echo "  • Transparency: 10-15%"
        echo "  • Blur: Slight"
    fi
fi

echo ""
echo -e "${CYAN}🎨 Font Features:${NC}"
echo ""

case $choice in
    1)
        echo "JetBrainsMono Nerd Font:"
        echo "  ✓ Designed specifically for coding"
        echo "  ✓ Excellent readability"
        echo "  ✓ Wide character support"
        echo "  ✓ Compatible with all dev tools"
        ;;
    2)
        echo "FiraCode Nerd Font:"
        echo "  ✓ Programming ligatures (!=, =>, >=)"
        echo "  ✓ Modern and clean"
        echo "  ✓ Very popular in VS Code"
        ;;
    3)
        echo "Hack Nerd Font:"
        echo "  ✓ Open source"
        echo "  ✓ High readability"
        echo "  ✓ Classic developer font"
        ;;
esac

echo ""
echo -e "${CYAN}🔍 Test:${NC}"
echo ""
echo "Open a new terminal and run this:"
echo ""
echo -e "${YELLOW}  echo '      '${NC}"
echo ""
echo "If you see icons, the font is working! ✅"
echo ""

echo -e "${GREEN}Enjoy! 🚀${NC}"
