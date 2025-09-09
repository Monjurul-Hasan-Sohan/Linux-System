# README.md

# Zsh + Powerlevel10k on Ubuntu 24.04 (One-Shot Installer)

This repo contains an idempotent Bash script that installs and configures:

- **Zsh** (as your login shell, optional)
- **Powerlevel10k** theme (fast, pretty, configurable)
- **zsh-autosuggestions** and **zsh-syntax-highlighting**
- **MesloLGS Nerd Fonts** (recommended by Powerlevel10k)
- Safe defaults for history, completion, and prompt speed (instant prompt)

## What it does

1. Installs required packages via `apt` (zsh, git, curl, fontconfig, etc.).
2. Installs **MesloLGS Nerd Fonts** to `~/.local/share/fonts` and refreshes font cache.
3. Installs **Zinit** (plugin manager) to `~/.local/share/zinit/zinit.git`.
4. Writes a clean `~/.zshrc` and a minimal, fast `~/.p10k.zsh` (backs up old files).
5. Optionally runs `chsh` to set Zsh as your default shell.
6. Prints a **before/after** status summary so you can verify everything.

## Usage

```bash
# Make executable and run
chmod +x install_zsh_p10k_ubuntu.sh
./install_zsh_p10k_ubuntu.sh

