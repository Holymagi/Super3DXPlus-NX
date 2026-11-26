#!/bin/sh
# Guided setup for Super3DXPlus-NX (Linux / macOS)
# Usage: ./setup.sh [optional args for build.py]

cd "$(dirname "$0")" || exit 1

if [ ! -f "build.py" ]; then
  echo "[ERROR] build.py not found! Make sure you downloaded the full repository."
  exit 1
fi

# Quick reminder if required arcade dump assets aren't present yet
if [ ! -f "data/menu.bin" ]; then
  echo "[NOTE] data/menu.bin not found yet."
  echo "       You will need your own WMMT 3DX+ arcade dump to extract required assets."
  echo ""
fi

if [ $# -eq 0 ]; then
  set -- wizard
fi

if command -v python3 >/dev/null 2>&1; then
  exec python3 build.py "$@"
fi

echo "[ERROR] Python 3 is not installed."
echo "  - Ubuntu/Debian : sudo apt install python3 python3-pip python3-venv"
echo "  - Arch/CachyOS  : sudo pacman -S python python-pip"
echo "  - Fedora        : sudo dnf install python3 python3-pip"
echo "  - macOS         : brew install python3"
exit 1
