#!/data/data/com.termux/files/usr/bin/bash

# Termux Toolkit Installer
# Author: Khayom Abdurahmonov (Khayom1.github.io)

set -e

TOOLKIT_DIR="$HOME/.termux-toolkit"
BIN_DIR="$PREFIX/bin"

echo "[*] Installing Termux Toolkit..."

# Create directories
mkdir -p "$TOOLKIT_DIR/bin"
mkdir -p "$TOOLKIT_DIR/scripts"

# Copy tools
cp -f bin/* "$TOOLKIT_DIR/bin/" 2>/dev/null || true
cp -f scripts/* "$TOOLKIT_DIR/scripts/" 2>/dev/null || true

# Make executable
chmod +x "$TOOLKIT_DIR/bin/"* 2>/dev/null || true

# Create symlinks
for tool in "$TOOLKIT_DIR/bin/"*; do
  if [ -f "$tool" ]; then
    name=$(basename "$tool")
    ln -sf "$tool" "$BIN_DIR/$name"
    echo "[+] Installed: $name"
  fi
done

echo ""
echo "[✓] Termux Toolkit installed successfully!"
echo "    Author: Khayom Abdurahmonov"
echo "    Site:   https://khayom1.github.io"
echo ""
echo "Available commands:"
echo "  sysinfo   - System information"
echo "  netcheck  - Network check"
echo "  gitstat   - Git status helper"
echo "  tk-update - Update toolkit"
