#!/bin/sh
# Super3DXPlus-NX - Nintendo Switch Builder (Linux / macOS)
# Usage: ./setup-switch.sh [path/to/wmmt3dxplus_dump]

cd "$(dirname "$0")" || exit 1

echo "========================================================"
echo "        Super3DXPlus-NX - Nintendo Switch Setup"
echo "========================================================"
echo ""

# 1. Check Python 3
if ! command -v python3 >/dev/null 2>&1; then
    echo "[ERROR] Python 3 is not installed."
    echo "  - Ubuntu/Debian : sudo apt install python3 python3-pip"
    echo "  - Arch/CachyOS  : sudo pacman -S python python-pip"
    echo "  - Fedora        : sudo dnf install python3 python3-pip"
    echo "  - macOS         : brew install python3"
    exit 1
fi

# 2. Check devkitPro
if [ -z "$DEVKITPRO" ] || [ ! -d "$DEVKITPRO/libnx" ]; then
    echo "[ERROR] devkitPro / libnx not found."
    echo "Make sure DEVKITPRO is set and these packages are installed:"
    echo "  switch-dev, switch-sdl2, switch-mesa, switch-zlib"
    exit 1
fi

# 3. Get WMMT 3DX+ dump folder
DUMP_DIR="$1"
while [ -z "$DUMP_DIR" ] || [ ! -f "$DUMP_DIR/main" ]; do
    if [ -n "$DUMP_DIR" ]; then
        echo ""
        echo "[ERROR] 'main' file not found in: $DUMP_DIR"
        echo "Please enter a valid WMMT 3DX+ arcade dump folder."
        echo ""
    fi
    printf "Enter WMMT 3DX+ dump folder path (contains 'main' and 'data'): "
    read -r DUMP_DIR
    # Strip surrounding quotes if dragged and dropped into terminal
    DUMP_DIR=$(echo "$DUMP_DIR" | sed "s/^['\"]//; s/['\"]$//")
done

echo ""
echo "[1/4] Checking Zig (C++ demangler for physics recompiler)..."
if [ ! -f ".super3dx/zig/zig" ]; then
    python3 build.py setup-zig || { echo "[ERROR] Failed to install Zig."; exit 1; }
else
    echo "Zig is already installed, continuing..."
fi

echo ""
echo "[2/4] Generating assets and physics (--phys)..."
echo "(This may take a few minutes, please wait)"
python3 tools/pipeline.py gen "$DUMP_DIR" --phys || { echo "[ERROR] Failed at pipeline.py gen --phys."; exit 1; }

echo ""
echo "[3/4] Compiling Nintendo Switch NRO..."
python3 build.py switch || { echo "[ERROR] Failed to compile Switch NRO."; exit 1; }

echo ""
echo "[4/4] Preparing SD Card output folder..."
OUT_DIR="output-switch/switch/super3dx+nx"
mkdir -p "$OUT_DIR/data"

if [ ! -f "platform/switch/super3dx+nx.nro" ]; then
    echo "[ERROR] Compiled NRO not found at platform/switch/super3dx+nx.nro"
    exit 1
fi

cp -f "platform/switch/super3dx+nx.nro" "$OUT_DIR/super3dx+nx.nro"
cp -rf data/* "$OUT_DIR/data/"

if [ ! -f "$OUT_DIR/data/menu.bin" ]; then
    echo ""
    echo "[WARNING] data/menu.bin was not found in the output folder!"
    echo "          The game will not boot without menu.bin from a complete 3DX+ dump."
fi

echo ""
echo "========================================================"
echo "DONE! Nintendo Switch build completed successfully."
echo ""
echo "Copy the contents of:"
echo "  $(pwd)/output-switch/"
echo "directly to the root of your Switch SD Card (sdmc:/)."
echo "========================================================"
