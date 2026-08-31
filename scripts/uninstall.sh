#!/usr/bin/env sh
# Removes installed symlinks from bin directory.
set -eu

target_dir="${1:-$HOME/.local/bin}"

rm -f "$target_dir/claude-9router"
rm -f "$target_dir/vscode-switch"

echo "Removed symlinks from $target_dir:"
echo "  claude-9router"
echo "  vscode-switch"
