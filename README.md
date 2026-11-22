# Super3DX+ NX (Unofficial Nintendo Switch Port)

An unofficial Nintendo Switch homebrew port of **[Super3DXPlus](https://github.com/smolderyguest/Super3DXPlus)** (Wangan Midnight Maximum Tune 3DX+ recompilation), ported by **Holymagi** using `devkitPro`, `libnx`, and `SDL2`.

> ⚠️ **DISCLAIMER:** This repository contains **source code only**. No copyrighted game assets, ROMs, or `data/` files are included or distributed here. You must legally obtain and supply your own game files.

## Features & Status (v1.0.1)
- Native Nintendo Switch execution (`.nro`) powered by OpenGL ES 3.2 (Mesa/Nouveau) & SDL2.
- Full save-data persistence (`garage` & `ranking`) fixed for Horizon FS / FAT32 and Eden Emulator.
- Smooth 60 FPS gameplay on Nintendo Switch (no overclock required) and Eden Emulator.

## Known Issues
- **10 Outrun Mode:** Boundary/target lines may occasionally disappear and the screen can briefly flash blue (especially around the 10th rival). This is a minor rendering glitch and does not cause crashes.

## Requirements
- Nintendo Switch with CFW (Atmosphère) on Firmware **22.x.x** (or Eden Emulator on PC).
- **Full RAM access** (launch via **Title Takeover** by holding `R` on a game, or via an NSP Forwarder). **Applet Mode (Album) is NOT supported.**
- Your own legally obtained `data/` folder.

## Installation
1. Download `Super3DXPlus-NX_v1.0.1.zip` from the [Releases](../../releases) tab.
2. Extract the `.zip` directly to the root of your SD card (`sdmc:/`). This will create `sdmc:/switch/Super3DXPlus/` containing `Super3DXPlus.nro` and an empty `data/` folder.
3. Copy your own `data/` files into `sdmc:/switch/Super3DXPlus/data/`.
4. Launch via Title Takeover or NSP Forwarder.

## Building from Source
Requires **devkitPro** (MSYS2 on Windows) with `switch-dev`, `switch-sdl2`, and `switch-mesa` installed:

```bash
make -f Makefile.switch

```markdown
# Super3DX+ NX (Unofficial Nintendo Switch Port)

An unofficial Nintendo Switch homebrew port of **[Super3DXPlus](https://github.com/smolderyguest/Super3DXPlus)** (Wangan Midnight Maximum Tune 3DX+ recompilation), ported by **Holymagi** using `devkitPro`, `libnx`, and `SDL2`.

> ⚠️ **DISCLAIMER:** This repository contains **source code only**. No copyrighted game assets, ROMs, or `data/` files are included or distributed here. You must legally obtain and supply your own game files.

## Features & Status (v1.0.1)
- Native Nintendo Switch execution (`.nro`) powered by OpenGL ES 3.2 (Mesa/Nouveau) & SDL2.
- Full save-data persistence (`garage` & `ranking`) fixed for Horizon FS / FAT32 and Eden Emulator.
- Smooth 60 FPS gameplay on Nintendo Switch (no overclock required) and Eden Emulator.

## Known Issues
- **10 Outrun Mode:** Boundary/target lines may occasionally disappear and the screen can briefly flash blue (especially around the 10th rival). This is a minor rendering glitch and does not cause crashes.

## Requirements
- Nintendo Switch with CFW (Atmosphère) on Firmware **22.x.x** (or Eden Emulator on PC).
- **Full RAM access** (launch via **Title Takeover** by holding `R` on a game, or via an NSP Forwarder). **Applet Mode (Album) is NOT supported.**
- Your own legally obtained `data/` folder.

## Installation
1. Download `Super3DXPlus-NX_v1.0.1.zip` from the [Releases](../../releases) tab.
2. Extract the `.zip` directly to the root of your SD card (`sdmc:/`). This will create `sdmc:/switch/Super3DXPlus/` containing `Super3DXPlus.nro` and an empty `data/` folder.
3. Copy your own `data/` files into `sdmc:/switch/Super3DXPlus/data/`.
4. Launch via Title Takeover or NSP Forwarder.

## Building from Source
Requires **devkitPro** (MSYS2 on Windows) with `switch-dev`, `switch-sdl2`, and `switch-mesa` installed:

```bash
make -f Makefile.switch

```

## License & Credits

Licensed under the **MIT License** (`LICENSE`), preserving Re3DX+'s copyright. Game content is not covered and not included. See `NOTICE.md` for details.

* **Super3DX+ NX (Switch Port):** ported and maintained by **[Holymagi](https://www.google.com/search?q=https://github.com/Holymagi)**.
* **Super3DX+:** developed by **[smolderyguest](https://github.com/smolderyguest/Super3DXPlus)**.
* **Re3DX+:** by **[Allannn-sudo](https://github.com/Allannn-sudo)** — the original conversion effort, including the static recompilation of the physics and the first rewrite of rendering, menus, HUD, sound, and data converters (MIT).
* **libretro / Lakka-LibreELEC:** reference for composite output and filtering methods in upstream Super3DX+.

## Official Website

* 🌐 **Super3DX+ NX Portal:** [super3dxpluss-nx.vercel.app](https://www.google.com/search?q=https://super3dxpluss-nx.vercel.app)

```

```
