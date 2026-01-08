#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/deploy_common.sh"

# -----------------------------
# Diff mode: only sync changed files
# -----------------------------
if [[ "${1:-}" == "--diff" ]]; then
    cd "$DOTFILES_DIR"
    git diff --name-only | while read -r file; do
        case "$file" in
            mac/*)     dst="$HOME/${file#mac/}" ;;
            .claude/*) dst="$HOME/$file" ;;
            .cursor/*) dst="$HOME/$file" ;;
            *)         continue ;;
        esac
        echo "SYNC: $file -> $dst"
        rsync -a "$DOTFILES_DIR/$file" "$dst"
    done
    exit 0
fi

# -----------------------------
# Directories
# -----------------------------
mkdir -p \
  ~/.vim/{colors,snippets} \
  ~/scripts \
  ~/.claude \
  ~/.cursor

# -----------------------------
# Helper: recursively symlink a tree (files only)
# -----------------------------
link_tree() {
  local src_root="$1"
  local dst_root="$2"

  [[ -d "$src_root" ]] || return 0

  find "$src_root" -type f -print0 | while IFS= read -r -d '' src; do
    local rel="${src#"$src_root"/}"
    local dst="$dst_root/$rel"
    mkdir -p "$(dirname "$dst")"
    mln_if_exists "$src" "$dst" || true
  done
}

# -----------------------------
# Dotfiles (single files)
# -----------------------------
mln_if_exists "$DOTFILES_DIR/mac/.bash_profile"   ~/.bash_profile   || true
mln_if_exists "$DOTFILES_DIR/mac/.bash_aliases"   ~/.bash_aliases   || true
mln_if_exists "$DOTFILES_DIR/mac/.bashrc"         ~/.bashrc         || true
mln_if_exists "$DOTFILES_DIR/mac/.vimrc"          ~/.vimrc          || true
mln_if_exists "$DOTFILES_DIR/mac/.vimrc.local"    ~/.vimrc.local    || true
mln_if_exists "$DOTFILES_DIR/mac/.tmux.conf"      ~/.tmux.conf      || true
mln_if_exists "$DOTFILES_DIR/mac/.tpu_aliases"    ~/.tpu_aliases    || true
mln_if_exists "$DOTFILES_DIR/.tmux.config"        ~/.tmux.config    || true
mln_if_exists "$DOTFILES_DIR/mac/.secrets"        +~/.secrets       || true

# -----------------------------
# Claude + Cursor (entire trees)
# -----------------------------
link_tree "$DOTFILES_DIR/.claude" "$HOME/.claude"
link_tree "$DOTFILES_DIR/.cursor" "$HOME/.cursor"
