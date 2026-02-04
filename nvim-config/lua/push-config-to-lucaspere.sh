#!/usr/bin/env bash
# Push this Neovim config into lucaspere/lucaspere as subfolder "nvim-config/"
# Run from your machine (not in sandbox). Usage: bash lua/push-config-to-lucaspere.sh
# Requires: git, rsync or cp

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_URL="https://github.com/lucaspere/lucaspere.git"
CLONE_DIR="${CLONE_DIR:-/tmp/lucaspere-repo}"

echo "==> Neovim config root: $NVIM_ROOT"
echo "==> Clone target: $CLONE_DIR"
echo "==> Fetching lucaspere repo..."
rm -rf "$CLONE_DIR"
git clone --depth 1 "$REPO_URL" "$CLONE_DIR"

echo "==> Copying config into $CLONE_DIR/nvim-config/ (excluding .git)..."
mkdir -p "$CLONE_DIR/nvim-config"
if command -v rsync &>/dev/null; then
  rsync -a --exclude='.git' --exclude='_lucaspere_push' "$NVIM_ROOT/" "$CLONE_DIR/nvim-config/"
else
  for f in "$NVIM_ROOT"/* "$NVIM_ROOT"/.[!.]* "$NVIM_ROOT"/..?*; do
    [ -e "$f" ] || continue
    base=$(basename "$f")
    [ "$base" = ".git" ] && continue
    [ "$base" = "_lucaspere_push" ] && continue
    [ "$base" = "." ] && continue
    [ "$base" = ".." ] && continue
    cp -R "$f" "$CLONE_DIR/nvim-config/"
  done
fi

echo "==> Committing and pushing..."
cd "$CLONE_DIR"
git add nvim-config/
git status
if git diff --cached --quiet; then
  echo "No changes to commit (nvim-config already up to date?)."
else
  git commit -m "chore: add Neovim config in nvim-config/"
  git push origin main
  echo "==> Pushed to $REPO_URL (branch main, folder nvim-config/)"
fi
echo "==> Done. Clone left at $CLONE_DIR (remove with: rm -rf $CLONE_DIR)"
