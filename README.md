# Super3DXPlus-NX (NSwitch3DX+)

![Platform](https://img.shields.io/badge/Platform-Nintendo%20Switch%201-E60012?style=flat-square&logo=nintendoswitch&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Backend](https://img.shields.io/badge/Graphics-OpenGL%20ES%203.2%20(switch--mesa)-5586A4?style=flat-square)

An unofficial **Nintendo Switch** homebrew port of *Wangan Midnight Maximum Tune 3DX+*, built on top of [Super3DX+](https://github.com/smolderyguest/Super3DXPlus) and [Re3DX+](NOTICE.md) using `devkitPro`, `libnx`, `SDL2`, and OpenGL ES (`switch-mesa`).

> [!IMPORTANT]
> - **No Copyrighted Assets Included:** This repository contains **source code and build tools only**. No ROMs, arcade dumps, or `menu.bin` files are provided. You must supply your own legal dump of *Wangan Midnight Maximum Tune 3DX+* (Export or Japan).
> - **Switch 1 Family Only:** Built exclusively for modded Nintendo Switch 1 consoles (**V1, V2, Lite, and OLED** running CFW). **Nintendo Switch 2 is not supported**—please do not open issues or beg for Switch 2 ports.

---

## Features

- **Native 60 FPS Performance:** Runs at 1080p Docked / 720p Handheld via OpenGL ES 3.2 (`switch-mesa`).
- **Controller-First Experience:** Full Joy-Con and Pro Controller menu navigation, rebindable buttons/axes, deadzone tuning, and rumble support.
- **Complete Game Modes:** Story Mode (with Win Streak, Mileage Tally, and Car Aura), 10 Outrun, Time Attack, and LAN/Online Versus.
- **Automated Build Scripts:** Includes `setup-switch.bat` (Windows) and `setup-switch.sh` (Linux/macOS) to automate physics recompilation (`--phys`), NRO compilation, and ready-to-copy SD card packaging.

---

## Requirements

### Nintendo Switch
- A modded **Nintendo Switch 1** (V1, V2, Lite, or OLED) running **Atmosphère** CFW.
- **Title Takeover (Full RAM Mode) is required:** Hold `R` while launching any installed game to open the Homebrew Menu. **Applet Mode is not supported.**

### PC (for Building from Source)
- [Python 3.9+](https://www.python.org/downloads/)
- [devkitPro](https://devkitpro.org/) with the following packages installed:
  - `switch-dev`
  - `switch-sdl2`
  - `switch-mesa`
  - `switch-glad`
  - `switch-zlib`
- Your own *Wangan Midnight Maximum Tune 3DX+* arcade dump (containing the `main` binary and `data/` folder).

---

## Building from Source

1. Clone or download this repository.
2. Run the automated setup script for your OS:
   - **Windows:** Double-click **`setup-switch.bat`** (or drag & drop your 3DX+ dump folder directly onto the script).
   - **Linux / macOS:** Run `./setup-switch.sh /path/to/your/3dxplus_dump` in your terminal.
3. The script will automatically:
   - Verify your Python and devkitPro installations.
   - Set up Zig and generate synchronized physics (`phys_rc.c` + `data/phys.img`) via `tools/pipeline.py gen --phys`.
   - Compile `super3dx+nx.nro` and package everything into `output-switch/`.

> [!WARNING]
> Always keep `super3dx+nx.nro` and `data/phys.img` from the **exact same build**. Mixing files from different builds will cause `rc: bad address` crashes when entering a race.

---

## Installation on Switch

Copy the contents of `output-switch/` to the root of your Nintendo Switch SD card so the directory structure matches this layout:

```text
sdmc:/
└── switch/
    └── super3dx+nx/
        ├── super3dx+nx.nro
        └── data/
            ├── menu.bin
            ├── phys.img
            └── (converted game assets...)

1.Boot into Atmosphère

2.Open the Homebrew Menu via Title Takeover (hold R while launching any installed title)

3.Launch NSwitch3DX+

Credits & License
Nintendo Switch Port (Super3DXPlus-NX / NSwitch3DX+): Holymagi

Upstream Projects: Super3DX+ & Re3DX+ contributors — see NOTICE.md for full attributions.

License: Distributed under the MIT License — see LICENSE for details.

