#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$REPO_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/zprofile" "$HOME/.zprofile"
ln -sf "$REPO_DIR/p10k.zsh" "$HOME/.p10k.zsh"

echo "zsh config linked. restart your shell or run: source ~/.zshrc"
