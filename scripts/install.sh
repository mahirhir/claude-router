#!/usr/bin/env sh
# Symlinks claude-9router and vscode-switch into a bin directory in PATH.
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd -P)
target_dir="${1:-$HOME/.local/bin}"

mkdir -p "$target_dir"

ln -sf "$script_dir/claude-9router" "$target_dir/claude-9router"
chmod +x "$script_dir/claude-9router" "$target_dir/claude-9router"

ln -sf "$script_dir/vscode-switch" "$target_dir/vscode-switch"
chmod +x "$script_dir/vscode-switch" "$target_dir/vscode-switch"

echo "Installed symlinks into $target_dir:"
echo "  $target_dir/claude-9router -> $script_dir/claude-9router"
echo "  $target_dir/vscode-switch  -> $script_dir/vscode-switch"

case ":$PATH:" in
    *":$target_dir:"*) ;;
    *)
        echo ""
        echo "Note: $target_dir is not in your PATH."
        echo "Add it to your shell profile (~/.bashrc or ~/.zshrc):"
        echo "  export PATH=\"$target_dir:\$PATH\""
        ;;
esac
