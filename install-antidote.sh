#!/bin/bash

# Antidote + Modern Zsh Setup Installer
# =====================================

set -e  # Exit on error

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
ANTIDOTE_DIR="${ZDOTDIR:-$HOME}/.antidote"
BACKUP_SUFFIX=".backup.$(date +%Y%m%d_%H%M%S)"

echo -e "${CYAN}"
echo "╔════════════════════════════════════════╗"
echo "║   🚀 Antidote Kurulum Scripti 🚀      ║"
echo "╚════════════════════════════════════════╝"
echo -e "${NC}"

# Function to print status
print_status() {
    echo -e "${BLUE}▶${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# 1. Check system
print_status "Sistem kontrol ediliyor..."
echo "   Zsh versiyonu: $(zsh --version)"
echo "   Shell: $SHELL"
echo "   OS: $(uname -s)"
echo ""

# 2. Backup existing configs
if [ -f "$HOME/.zshrc" ]; then
    print_warning "Mevcut .zshrc yedekleniyor..."
    cp "$HOME/.zshrc" "$HOME/.zshrc${BACKUP_SUFFIX}"
    print_success "Backup: ~/.zshrc${BACKUP_SUFFIX}"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    print_warning "Oh My Zsh tespit edildi (backup alınacak, silinmeyecek)"
    if [ ! -d "$HOME/.oh-my-zsh${BACKUP_SUFFIX}" ]; then
        cp -r "$HOME/.oh-my-zsh" "$HOME/.oh-my-zsh${BACKUP_SUFFIX}"
        print_success "Backup: ~/.oh-my-zsh${BACKUP_SUFFIX}"
    fi
fi

echo ""

# 3. Install Homebrew packages
print_status "Homebrew paketleri kontrol ediliyor..."

check_and_install() {
    if ! command -v $1 &> /dev/null; then
        print_status "$1 kuruluyor..."
        brew install $1
        print_success "$1 kuruldu"
    else
        print_success "$1 zaten kurulu"
    fi
}

check_and_install "starship"
check_and_install "fzf"
check_and_install "zoxide"
check_and_install "bat"
check_and_install "eza"

echo ""

# 4. Install Antidote
print_status "Antidote kuruluyor..."

if [ -d "$ANTIDOTE_DIR" ]; then
    print_warning "Antidote zaten kurulu, güncelleniyor..."
    cd "$ANTIDOTE_DIR" && git pull
else
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

print_success "Antidote kuruldu: $ANTIDOTE_DIR"
echo ""

# 5. Create plugin list
print_status "Plugin listesi oluşturuluyor..."

cat > "$HOME/.zsh_plugins.txt" << 'PLUGINS'
# Oh My Zsh libs
ohmyzsh/ohmyzsh path:lib

# Oh My Zsh plugins
ohmyzsh/ohmyzsh path:plugins/git
ohmyzsh/ohmyzsh path:plugins/docker
ohmyzsh/ohmyzsh path:plugins/docker-compose
ohmyzsh/ohmyzsh path:plugins/kubectl
ohmyzsh/ohmyzsh path:plugins/aws
ohmyzsh/ohmyzsh path:plugins/golang
ohmyzsh/ohmyzsh path:plugins/node
ohmyzsh/ohmyzsh path:plugins/npm
ohmyzsh/ohmyzsh path:plugins/python
ohmyzsh/ohmyzsh path:plugins/pip
ohmyzsh/ohmyzsh path:plugins/vscode

# Essential plugins
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
zsh-users/zsh-history-substring-search

# Additional useful plugins
Aloxaf/fzf-tab
PLUGINS

print_success "Plugin listesi oluşturuldu: ~/.zsh_plugins.txt"
echo ""

# 6. Create new .zshrc
print_status "Yeni .zshrc oluşturuluyor..."

cat > "$HOME/.zshrc" << 'ZSHRC'
# ============================================
# Antidote + Modern Zsh Configuration
# ============================================

# Environment variables
export EDITOR='vim'
export VISUAL='vim'
export LANG='en_US.UTF-8'

# Path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ============================================
# Completion Settings
# ============================================

# Enable completion system
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Menu selection
zstyle ':completion:*' menu select

# ============================================
# Antidote Plugin Manager
# ============================================

# Set the name of the static .zsh plugins file antidote will generate
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure .zsh_plugins.txt file exists
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory
fpath=(${ZDOTDIR:-~}/.antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file
source ${zsh_plugins}.zsh

# ============================================
# Zsh Options
# ============================================

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY          # Write timestamp to history file
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_SPACE         # Don't record entries starting with space
setopt HIST_VERIFY               # Don't execute immediately upon history expansion
setopt SHARE_HISTORY             # Share history between sessions

# Directory navigation
setopt AUTO_CD                   # Auto cd when typing directory name
setopt AUTO_PUSHD                # Push directories onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_SILENT              # Don't print directory stack

# Completion
setopt ALWAYS_TO_END             # Move cursor to end after completion
setopt AUTO_MENU                 # Show completion menu on tab press
setopt COMPLETE_IN_WORD          # Complete from both ends
setopt LIST_PACKED               # Compact completion lists

# ============================================
# Starship Prompt
# ============================================

eval "$(starship init zsh)"

# ============================================
# Modern CLI Tools
# ============================================

# Zoxide (better cd)
eval "$(zoxide init zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# ============================================
# Aliases
# ============================================

# Modern replacements
if command -v eza &> /dev/null; then
    alias ls='eza --icons'
    alias ll='eza -lah --icons'
    alias la='eza -a --icons'
    alias lt='eza --tree --level=2 --icons'
fi

if command -v bat &> /dev/null; then
    alias cat='bat --paging=never'
fi

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Docker aliases
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dc='docker-compose'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Utilities
alias reload='source ~/.zshrc'
alias zshconfig='$EDITOR ~/.zshrc'
alias pluginconfig='$EDITOR ~/.zsh_plugins.txt'

# macOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
fi

# ============================================
# Custom Functions
# ============================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick server
server() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}



# ============================================
# Key Bindings
# ============================================

# Use emacs key bindings
bindkey -e

# History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ============================================
# Performance Optimization
# ============================================

# Disable auto-update checks for speed
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# ============================================
# Personal Additions
# ============================================

# Add your personal configurations below

ZSHRC

print_success "Yeni .zshrc oluşturuldu"
echo ""

# 7. Create Starship config
print_status "Starship konfigürasyonu oluşturuluyor..."

mkdir -p "$HOME/.config"

cat > "$HOME/.config/starship.toml" << 'STARSHIP'
# Starship Configuration
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

# Minimal prompt
format = """
[╭─](bold green)$username$hostname$directory$git_branch$git_status$nodejs$python$golang$rust$docker_context
[╰─](bold green)$character"""

# Disable command duration by default
[cmd_duration]
disabled = true

# Character
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"

# Directory
[directory]
style = "bold cyan"
truncation_length = 3
truncate_to_repo = true

# Git branch
[git_branch]
symbol = " "
style = "bold purple"

# Git status
[git_status]
style = "bold yellow"
conflicted = "🏳"
ahead = "⇡${count}"
behind = "⇣${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
untracked = "🤷"
stashed = "📦"
modified = "📝"
staged = '[++\($count\)](green)'
renamed = "👅"
deleted = "🗑"

# Language versions
[nodejs]
symbol = " "
style = "bold green"

[python]
symbol = " "
style = "bold yellow"

[golang]
symbol = " "
style = "bold cyan"

[rust]
symbol = " "
style = "bold red"

# Docker
[docker_context]
symbol = " "
style = "bold blue"

# Username
[username]
style_user = "bold yellow"
style_root = "bold red"
format = "[$user]($style) "
disabled = false
show_always = false

# Hostname
[hostname]
ssh_only = true
format = "on [$hostname](bold red) "
disabled = false
STARSHIP

print_success "Starship config oluşturuldu: ~/.config/starship.toml"
echo ""

# 8. Setup fzf
print_status "FZF ayarları yapılıyor..."
if command -v fzf &> /dev/null; then
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
    print_success "FZF keybindings kuruldu"
fi

echo ""
echo -e "${GREEN}"
echo "╔════════════════════════════════════════╗"
echo "║        ✅ Kurulum Tamamlandı! ✅       ║"
echo "╚════════════════════════════════════════╝"
echo -e "${NC}"

echo ""
echo -e "${CYAN}📝 Sonraki Adımlar:${NC}"
echo ""
echo "1. Yeni shell başlat:"
echo -e "   ${YELLOW}exec zsh${NC}"
echo ""
echo "2. Veya terminal'i yeniden başlat"
echo ""
echo "3. Plugin güncellemek için:"
echo -e "   ${YELLOW}antidote update${NC}"
echo ""
echo "4. Konfigürasyonu düzenle:"
echo -e "   ${YELLOW}vim ~/.zshrc${NC}"
echo -e "   ${YELLOW}vim ~/.zsh_plugins.txt${NC}"
echo ""
echo -e "${CYAN}📚 Kullanışlı Komutlar:${NC}"
echo ""
echo "  • reload        - .zshrc'yi yeniden yükle"
echo "  • zshconfig     - .zshrc'yi düzenle"
echo "  • pluginconfig  - plugin listesini düzenle"
echo "  • antidote update - pluginleri güncelle"
echo ""
echo -e "${CYAN}🎨 Prompt Özelleştirme:${NC}"
echo ""
echo "  Starship: ~/.config/starship.toml"
echo "  Preset'ler: https://starship.rs/presets/"
echo ""
echo -e "${GREEN}Keyifli kullanımlar! 🚀${NC}"
