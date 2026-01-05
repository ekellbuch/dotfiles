#!/bin/bash

set -euo pipefail

# Get the absolute path to the directory containing this script.
# This allows the script to work correctly regardless of where it's called from.
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# mln: "managed link" - Creates a symbolic link with safety checks.
# Usage: mln <source> <destination>
# Returns 0 on success or if link already exists correctly, 1 on skip/error.
mln() {
    local src="$(realpath "$1")"  # Convert source to absolute path
    local dst="$2"

    # Ensure the parent directory of the destination exists
    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        # Destination is already a symlink - check if it points to the right place
        local current="$(readlink "$dst")"
        if [ "$current" = "$src" ]; then
            echo "OK: $dst already linked"
            return 0  # Already linked, nothing to do
        else
            echo "SKIP: $dst exists, points to $current (expected $src)"
            return 1
        fi
    elif [ -e "$dst" ]; then
        # Destination exists as a regular file/directory - don't overwrite
        echo "SKIP: $dst exists as regular file"
        return 1
    else
        # Safe to create the symlink
        ln -s "$src" "$dst"
        echo "LINK: $dst -> $src"
    fi
}

# mln_if_exists: Conditional wrapper around mln.
# Only creates the link if the source file exists.
# Usage: mln_if_exists <source> <destination>
mln_if_exists() {
    [ -e "$1" ] && mln "$1" "$2"
}