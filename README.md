# Super3DX+ NX (Unofficial Nintendo Switch Port)

An unofficial Nintendo Switch homebrew port of **[Super3DXPlus](https://github.com/smolderyguest/Super3DXPlus)** by **smolderyguest** (Wangan Midnight Maximum Tune 3DX+ recompilation), built with `devkitPro`, `libnx`, and `SDL2`.

> ⚠️ **DISCLAIMER:** This repository contains **source code only**. No copyrighted game assets, ROMs, or `data/` files are included or distributed here. You must legally obtain and supply your own game files.

## Features & Status (v1.0.1)
- Native Nintendo Switch execution (`.nro`) via OpenGL ES 3.2 (Mesa/Nouveau) & SDL2.
- Full save-data persistence (`garage` & `ranking`) fixed for Horizon FS / FAT32 and Eden Emulator.
- Runs smoothly at 60 FPS on Nintendo Switch (no overclock required) and Eden Emulator.

## Known Issues
- **10 Outrun Mode:** Boundary/target lines may occasionally disappear and the screen can briefly flash blue (especially around the 10th rival). This is a minor rendering glitch and does not cause crashes.

## Requirements
- Nintendo Switch with CFW (Atmosphère) on Firmware **22.x.x** (or Eden Emulator on PC).
- **Full RAM access** (launch via Title Takeover by holding `R` on a game, or via NSP Forwarder). **Applet Mode (Album) is NOT supported.**
- Your own legally obtained `data/` folder.

## Installation
1. Download `Super3DXPlus-NX_v1.0.1.zip` from the [Releases](../../releases) tab.
2. Extract the `.zip` directly to the root of your SD card (`sdmc:/`). This will create `sdmc:/switch/Super3DXPlus/` with `Super3DXPlus.nro` and an empty `data/` folder.
3. Copy your own `data/` files into `sdmc:/switch/Super3DXPlus/data/`.
4. Launch via Title Takeover or NSP Forwarder.

## Building from Source
Requires **devkitPro** (MSYS2 on Windows) with `switch-dev`, `switch-sdl2`, and `switch-mesa` installed:

```bash
make -f Makefile.switch
