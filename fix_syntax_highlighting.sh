#!/usr/bin/env bash
# fix_syntax_highlighting.sh
set -euo pipefail

PLUG_DIR="$HOME/.zsh/plugins"
SYN_DIR="$PLUG_DIR/zsh-syntax-highlighting"
ZSHRC="$HOME/.zshrc"

echo "[+] Ensuring plugin is installed…"
mkdir -p "$PLUG_DIR"
if [[ -d "$SYN_DIR/.git" ]]; then
  git -C "$SYN_DIR" pull --ff-only || true
else
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYN_DIR"
fi

echo "[+] Making sure ~/.zshrc exists…"
[[ -f "$ZSHRC" ]] || touch "$ZSHRC"

echo "[+] Removing any old sourcing lines for syntax-highlighting…"
sed -i '/zsh-syntax-highlighting\.zsh/d' "$ZSHRC"

echo "[+] Appending correct load order (keep it LAST)…"
cat >> "$ZSHRC" <<'ZRC'

# >>> zsh-syntax-highlighting (auto)
# Load AFTER everything else (especially after completion and autosuggestions)
# Optional: make effects obvious
typeset -ga ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'         # invalid command -> red
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=cyan,bold'        # if, for, do, etc.
ZSH_HIGHLIGHT_STYLES[command]='fg=green'                  # valid command
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# <<< zsh-syntax-highlighting (auto)
ZRC

echo "[+] Reloading shell…"
exec zsh -l
